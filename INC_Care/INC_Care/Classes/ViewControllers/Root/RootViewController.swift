//
//  RootViewController.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/15/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("userDefaults did load: \(Defaults[.patientUserDefault].id)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}
