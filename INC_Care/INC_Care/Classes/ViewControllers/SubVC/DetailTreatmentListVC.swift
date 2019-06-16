//
//  DetailTreatmentListVC.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/16/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import UIKit

class DetailTreatmentListVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var treatmentList = [Treatment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    private func configTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: TreatmentCell.identifier, bundle: nil),
                           forCellReuseIdentifier: TreatmentCell.identifier)
        tableView.isEmptyRowsHidden = true
        tableView.allowsSelection = false
        tableView.rowHeight = 100
    }

}

extension DetailTreatmentListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return treatmentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let treatmentCell = tableView.dequeueReusableCell(ofType: TreatmentCell.self, for: indexPath)
        let treatment = treatmentList[safe: indexPath.row] ?? Treatment()
        treatmentCell?.configCell(treatment: treatment)
        return treatmentCell ?? UITableViewCell()
    }
    
}

