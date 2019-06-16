//
//  Constants.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

struct Constants {
    
    struct shared {
        static var savedPatient = Patient()
    }
    
    struct Screen {
        static var IPHONE_10_NATIVE_HEIGHT = CGFloat(2436)
    }
    
    struct Colors {
        static let mainColor: UIColor = UIColor.init(rgb: 0xED1C23)
        static let subMainColor: UIColor = UIColor.init(rgb: 0xD80064)
    }
}

extension Constants {
    
    static func loadShared() {
        Constants.shared.savedPatient = Defaults[.patientUserDefault]
    }
    
    static func clearData() {
        Constants.shared.savedPatient = Patient()
        Defaults[.patientUserDefault] = Patient()
    }
}
