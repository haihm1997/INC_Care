//
//  TreatmentCource.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/16/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import Foundation
import SwiftyJSON

class TreatmentCource: NSObject {
    
    var checkinTime = ""
    var hospitalName = ""
    var id = ""
    var totalRemainingAmount = 0
    var totalInsurerPaidAmount = 0
    var totalTreatmentBuillAmount = 0
    var treatmentList = [Treatment]()
    var insurancePaidStatus = false
    var checkOutTime = ""
    
    override init() {
        super.init()
    }
    
    init(json: JSON) {
        self.checkinTime = json["checkinTime"].stringValue.toDate()
        self.hospitalName = json["hospitalName"].stringValue
        self.checkOutTime = json["checkoutTime"].stringValue.toDate()
        self.id = json["id"].stringValue
        self.totalInsurerPaidAmount = json["totalInsurerPaidAmount"].intValue
        self.totalTreatmentBuillAmount = json["totalTreatmentBillAmount"].intValue
        self.treatmentList = json["treatmentList"].arrayValue.map({ Treatment(json: $0) })
        self.insurancePaidStatus = json["insurerPaidStatus"].stringValue == "D" ? true : false
        self.totalRemainingAmount = totalTreatmentBuillAmount - totalInsurerPaidAmount
    }
}
