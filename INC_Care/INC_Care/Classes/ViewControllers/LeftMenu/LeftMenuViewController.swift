//
//  LeftMenuViewController.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/15/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

protocol OptionMenuProtocol: class {

    func didTapLogOut()
    
}

class LeftMenuViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var delegate: OptionMenuProtocol?
    
    var menus: [Menu] = [ Menu(content: "Change Account"),
                          Menu(content: "Profile"),
                          Menu(content: "Setting"),
                          Menu(content: ""),
                          Menu(content: "Logout", isNegativeOption: true)
                        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: LeftMenuCell.identifier, bundle: nil),
                           forCellReuseIdentifier: "LeftMenuViewController")
        tableView.isEmptyRowsHidden = true
    }
    
    private func doLogout() {
        Constants.clearData()
        appDelegate.leftMenu(isShow: false)
        if let drawerMainVC = appDelegate.drawerVC.mainViewController as? RootViewController {
            let loginVC = drawerMainVC.instantiateViewController(fromStoryboard: .main, ofType: LoginViewController.self)
            drawerMainVC.navigationController?.setViewControllers([loginVC], animated: true)
        }
    }
    
}

extension LeftMenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let treatmentCell = tableView.dequeueReusableCell(ofType: LeftMenuCell.self, for: indexPath)
        let menu = menus[indexPath.row]
        treatmentCell?.configContent(menu: menu)
        return treatmentCell ?? UITableViewCell()
    }
    
}

extension LeftMenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case menus.count - 1:
            doLogout()
        default:
            return
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

class LeftMenuCell: UITableViewCell {
    
    @IBOutlet weak var menuContent: UILabel!
    
    public static let identifier = "LeftMenuCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configContent(menu: Menu) {
        menuContent.text = menu.content
        menuContent.textColor = menu.isNegativeOption ? .red : .black
    }
    
}
