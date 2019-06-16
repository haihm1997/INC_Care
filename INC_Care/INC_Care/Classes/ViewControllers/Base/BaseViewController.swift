//
//  BaseViewController.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/15/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    weak var appDelegate: AppDelegate!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.appDelegate = appDelegate
        }
    }
    
    func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func showNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
