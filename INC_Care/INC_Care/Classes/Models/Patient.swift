//
//  Patient.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/15/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import Foundation
import SwiftyJSON
import SwiftyUserDefaults

final class Patient: NSObject, Codable, DefaultsSerializable {
    
    var id = ""
    var name = ""
    var height = ""
    var weight = ""
    var dob = ""
    var gender = ""
    var address = ""
    var contact = ""
    var avatar = ""
    var insuranceContactList = [Insurance]()
    
    override init() {
        super.init()
    }
    
    init(id: String, name: String, height: String, weight: String, dob: String,
        gender: String, address: String, contact: String, avatar: String, insuranceList: [Insurance]) {
        self.id = id
        self.name = name
        self.height = height
        self.weight = weight
        self.dob = dob
        self.gender = gender
        self.address = address
        self.contact = contact
        self.avatar = avatar
        self.insuranceContactList = insuranceList
    }
    
    init(id: String) {
        self.id = id
        self.name = "David.J"
        self.height = "1.82"
        self.weight = "80"
        self.dob = "16/06/1997"
        self.gender = "Male"
        self.address = "Ha Noi City"
        self.contact = "0986913011"
        self.avatar = "profile"
        self.insuranceContactList = [
                                        Insurance(id: "1", status: "A", name: "AIA", insuranceLink: "https://akc-uiam-bucket-test.s3.ap-southeast-1.amazonaws.com/images/AIA-Demo/dummy_1559619942092.pdf"),
                                        Insurance(id: "2", status: "A", name: "AIABC", insuranceLink: "https://akc-uiam-bucket-test.s3.ap-southeast-1.amazonaws.com/images/AIA-Demo/dummy_1559619942092.pdf"),
                                        Insurance(id: "2", status: "A", name: "AIAAAA", insuranceLink: "https://akc-uiam-bucket-test.s3.ap-southeast-1.amazonaws.com/images/AIA-Demo/dummy_1559619942092.pdf")
                                    ]
    }
    
}
