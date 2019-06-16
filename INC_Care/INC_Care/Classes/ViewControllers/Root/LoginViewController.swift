//
//  LoginViewController.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/15/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import TextFieldEffects
import SwiftyUserDefaults
import KYDrawerController

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
     
    }
    
    private func addTextField() {
        let textFieldXCoordinator = (UIScreen.screenWidth / 2) - 150
        let userNameTF = SkyFloatingLabelTextField(frame: CGRect(x: textFieldXCoordinator, y: 240, width: 300, height: 60))
        userNameTF.placeholder = "User Name"
        userNameTF.title = "User Name:"
        userNameTF.selectedTitleColor = Constants.Colors.subMainColor
        userNameTF.selectedTitleColor = Constants.Colors.subMainColor
        userNameTF.lineColor = .black
        userNameTF.placeholderColor = .gray
        
        let passwordTF = SkyFloatingLabelTextField(frame: CGRect(x: textFieldXCoordinator, y: 316, width: 300, height: 60))
        passwordTF.placeholder = "Password"
        passwordTF.title = "Password:"
        passwordTF.selectedLineColor = Constants.Colors.subMainColor
        passwordTF.selectedTitleColor = Constants.Colors.subMainColor
        passwordTF.lineColor = .black
        passwordTF.placeholderColor = .gray
        passwordTF.isSecureTextEntry = true
        
        self.view.addSubview(userNameTF)
        self.view.addSubview(passwordTF)
    }
    
    private func doLogin(patient: Patient, onCompleted: @escaping () -> ()) {
        showLoading()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            onCompleted()
        }
    }
    
    private func showHomeVC() {
        let drawerVC = self.instantiateViewController(fromStoryboard: .main, ofType: KYDrawerController.self)
        appDelegate.drawerVC = drawerVC
        self.navigationController?.setViewControllers([drawerVC], animated: true)
    }
    
    // MARK: ACTION
    @IBAction func loginButtonTapped(_ sender: Any) {
        let patient = Patient(id: "1")
        doLogin(patient: patient) {
            DispatchQueue.main.async {
                Defaults[.patientUserDefault] = patient
                self.dismissLoading()
                self.showHomeVC()
            }
        }
    }

    
}
