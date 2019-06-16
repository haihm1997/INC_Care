//
//  HomeViewController.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/15/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var patientAmountLabel: UILabel!
    @IBOutlet weak var incPaidAmountLabel: UILabel!
    @IBOutlet weak var hospitalNameLabel: UILabel!
    
    let viewModel = HomeViewModel()
    var treatments = [Treatment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading()
        configTableView()
        tableView.isHidden = true
        viewModel.getTreatmentCources()
        addObserver()
        tableView.addPullToRefreshWithActionHandler {
            self.viewModel.getTreatmentCources()
        }
    }
    
    private func addObserver() {
        viewModel.apiStatus.asObservable().subscribe(onNext: { [weak self] value in
            guard let weakSelf = self else { return }
            if value == .success {
                weakSelf.treatments = weakSelf.viewModel.treatmentCources.treatmentList
                weakSelf.tableView.isHidden = false
                weakSelf.tableView.reloadData()
                weakSelf.fillData()
            } else if value == .failed {
                CustomDialog.shared().showSimpleAlert(message: weakSelf.viewModel.message, currentVC: weakSelf)
                weakSelf.viewModel.message = ""
            }
            weakSelf.tableView.stopPullToRefreshAnimating()
            weakSelf.dismissLoading()
        }).disposed(by: disposeBag)
        
        viewModel.confirmTreatmentStatus.asObservable().subscribe(onNext: { [weak self] value in
            guard let weakSelf = self else { return }
            if value == .success {
                CustomDialog.shared().showSimpleAlert(message: "Confirm Success!", currentVC: weakSelf)
            } else if value == .failed {
                CustomDialog.shared().showSimpleAlert(message: weakSelf.viewModel.message, currentVC: weakSelf)
                weakSelf.viewModel.message = ""
            }
            weakSelf.dismissLoading()
        }).disposed(by: disposeBag)
        
        viewModel.makePaymentStatus.asObservable().subscribe(onNext: { [weak self] value in
            guard let weakSelf = self else { return }
            if value == .success {
                CustomDialog.shared().showSimpleAlert(message: "Make build success!", currentVC: weakSelf)
                weakSelf.clearData()
            } else if value == .failed {
                CustomDialog.shared().showSimpleAlert(message: weakSelf.viewModel.message, currentVC: weakSelf)
                weakSelf.viewModel.message = ""
            }
            weakSelf.dismissLoading()
        }).disposed(by: disposeBag)
    }
    
    private func clearData() {
        viewModel.treatmentCources = TreatmentCource()
        treatments = [Treatment]()
        tableView.reloadData()
        patientAmountLabel.text = ""
        totalBillLabel.text = ""
        incPaidAmountLabel.text = ""
        hospitalNameLabel.text = ""
    }
    
    private func fillData() {
        patientAmountLabel.text = "\(viewModel.treatmentCources.totalRemainingAmount) $"
        totalBillLabel.text = "\(viewModel.treatmentCources.totalTreatmentBuillAmount) $"
        incPaidAmountLabel.text = "\(viewModel.treatmentCources.totalInsurerPaidAmount) $"
        hospitalNameLabel.text = viewModel.treatmentCources.hospitalName
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: TreatmentCell.identifier, bundle: nil),
                           forCellReuseIdentifier: TreatmentCell.identifier)
        tableView.register(UINib(nibName: ConfirmCell.identified, bundle: nil),
                           forCellReuseIdentifier: ConfirmCell.identified)
        tableView.isEmptyRowsHidden = true
    }
    
    @IBAction func makeBillTapped(_ sender: Any) {
        CustomDialog.shared().showAlertTwoOption(message: "Are you sure?", currentVC: self) {
            self.showLoading()
            self.viewModel.makePaymentTreatment()
        }
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return treatments.count > 0 ? treatments.count + 1 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < treatments.count {
            return setupTreatmentCell(indexPath: indexPath)
        } else {
            return setupConfirmCell(indexPath: indexPath)
        }
    }
    
    private func setupTreatmentCell(indexPath: IndexPath) -> UITableViewCell {
        let treatmentCell = tableView.dequeueReusableCell(ofType: TreatmentCell.self, for: indexPath)
        let treatment = treatments[safe: indexPath.row] ?? Treatment()
        treatmentCell?.configCell(treatment: treatment)
         return treatmentCell ?? UITableViewCell()
    }
    
    private func setupConfirmCell(indexPath: IndexPath) -> UITableViewCell {
        let confirmCell = tableView.dequeueReusableCell(ofType: ConfirmCell.self, for: indexPath)
        confirmCell?.delegate = self
        return confirmCell ?? UITableViewCell()
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension HomeViewController: ConfirmProtocol {
    
    func onConfirmButtonTapped() {
        showLoading()
        viewModel.confirmTreatmentCource()
    }
    
}
