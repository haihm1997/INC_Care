//
//  Menu.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/15/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import Foundation

class Menu: NSObject {
    
    var content = ""
    var isNegativeOption = false
    
    override init() {
        super.init()
    }
    
    init(content: String, isNegativeOption: Bool = false) {
        self.content = content
        self.isNegativeOption = isNegativeOption
    }
    
}
