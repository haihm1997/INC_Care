//
//  HistoryViewController.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/16/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import UIKit
import RxSwift

class HistoryViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = HistoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading()
        configTableView()
        addObservable()
        tableView.addPullToRefreshWithActionHandler {
            self.viewModel.getTreatmentCources()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getTreatmentCources()
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: HisTreatmentCourceCell.identified, bundle: nil),
                           forCellReuseIdentifier: HisTreatmentCourceCell.identified)
        tableView.isEmptyRowsHidden = true
    }
    
    private func addObservable() {
        viewModel.apiStatus.asObservable().subscribe(onNext: { [weak self] value in
            guard let weakSelf = self else { return }
            if value == .success {
                weakSelf.tableView.reloadData()
            } else if value == .failed {
                CustomDialog.shared().showSimpleAlert(message: weakSelf.viewModel.message, currentVC: weakSelf)
                weakSelf.viewModel.message = ""
            }
            weakSelf.tableView.stopPullToRefreshAnimating()
            weakSelf.dismissLoading()
        }).disposed(by: disposeBag)
    }

}

extension HistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.hisTreatmentCourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hisTreatmentCourceCell = tableView.dequeueReusableCell(ofType: HisTreatmentCourceCell.self, for: indexPath)
        let hisTreatmentCourceItem = viewModel.hisTreatmentCourse[indexPath.row]
        hisTreatmentCourceCell?.configView(hisTreatmentCourceItem)
        return hisTreatmentCourceCell ?? UITableViewCell()
    }
    
}

extension HistoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailTreatmentListVC = self.instantiateViewController(fromStoryboard: .main, ofType: DetailTreatmentListVC.self)
        detailTreatmentListVC.treatmentList = viewModel.hisTreatmentCourse[indexPath.row].treatmentList
        self.navigationController?.pushViewController(detailTreatmentListVC, animated: true)
    }
    
}
