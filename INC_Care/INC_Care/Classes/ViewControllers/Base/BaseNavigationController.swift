//
//  BaseNavigationController.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/15/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count > 0 {
            let button = UIButton()
            button.setImage(UIImage(named: "ic_back"), for: .normal)
            button.frame = CGRect(origin: .zero, size: CGSize(width: 30, height: 60))
            button.addTarget(self, action: #selector(back), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func back() {
        self.popViewController(animated: true)
    }
    
}
