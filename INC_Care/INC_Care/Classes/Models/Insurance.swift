//
//  Insurance.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/15/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import Foundation
import SwiftyJSON
import SwiftyUserDefaults

final class Insurance: NSObject, Codable, DefaultsSerializable {
    
    var id = ""
    var status = ""
    var name = ""
    var insuranceLink = ""
    
    override init() {
        super.init()
    }
    
    init(id: String, status: String, name: String, insuranceLink: String) {
        self.id = id
        self.status = status
        self.name = name
        self.insuranceLink = insuranceLink
    }
    
    
}
