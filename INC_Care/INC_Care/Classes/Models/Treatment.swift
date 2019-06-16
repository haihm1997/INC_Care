//
//  Treatment.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/15/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import Foundation
import SwiftyJSON

class Treatment: NSObject {
    
    var id = 0
    var name = ""
    var totalAmount = 0
    var incPaidAmount = 0
    var remainingAmount = 0
    var treatmentIcon = ""
    
    override init() {
        super.init()
    }
    
    init(json: JSON) {
        super.init()
        self.id = json["billingAndPaymentTransId"].intValue
        self.name = json["description"].stringValue
        self.totalAmount = json["treatmentBillAmount"].intValue
        self.incPaidAmount = json["insurerPaidAmount"].intValue
        self.remainingAmount = totalAmount - incPaidAmount
        self.treatmentIcon = getTreatmentIcon()
    }
    
    init(id: Int, name: String, totalAmount: Int, incPaidAmount: Int, remainingAmount: Int) {
        super.init()
        self.id = id
        self.name = name
        self.totalAmount = totalAmount
        self.incPaidAmount = incPaidAmount
        self.remainingAmount = remainingAmount
        self.treatmentIcon = getTreatmentIcon()
    }
    
    private func getTreatmentIcon() -> String {
        switch self.name {
        case TreatmentName.blood.rawValue:
            return "ic_blood"
        case TreatmentName.surgery.rawValue:
            return "ic_surgery"
        case TreatmentName.x_ray.rawValue:
            return "ic_x-ray"
        case TreatmentName.radition.rawValue:
            return "ic_radiation"
        default:
            return "ic_blood"
        }
    }
    
}

enum TreatmentName: String {
    case blood = "Blood Test"
    case surgery = "Surgery"
    case x_ray = "X-Ray"
    case radition = "Radiation Therapy"
}
