//
//  CustomDialog.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/16/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import UIKit

class CustomDialog {
    
    private static let customDialog = CustomDialog()
    
    private init() {
        
    }
    
    public static func shared() -> CustomDialog {
        return customDialog
    }
    
    func showSimpleAlert(title: String = "INC Care", message: String, currentVC: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        currentVC.present(alert, animated: true)
    }
    
    func showAlertTwoOption(title: String = "INC Care", message: String, currentVC: UIViewController, completed: @escaping () -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            completed()
        }))
        
        currentVC.present(alert, animated: true)
    }
    
}
