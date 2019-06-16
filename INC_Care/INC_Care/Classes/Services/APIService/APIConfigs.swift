//
//  APIConfigs.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

struct Address {
    
    static let baseUrl = "http://35.198.227.78:3003/api/"
    static let onChainBaseAPi = "http://35.198.227.78:8000/api/"
    
    struct Authen {
        static let login        =   "login"
    }
    
    struct Demo {
        static let getAllTreatment = "v1/getAllTreatmentTrans"
        static let getAllTreatmentCourse = "Patient/TreatmentCourse/GetAll"
        static let getPHR = "Patient/TreatmentCourse/ViewCurrentCourse"
        static let getViewCurrent = "Patient/TreatmentCourse/ViewCurrentCourse"
    }
    
    struct Treatment {
        static let getAllTreatmentCources = "patient/treatmentCourse/GetAll"
        static let confirmTreatmentCource = "http://35.198.227.78:8000/api/v1/Patient/TreatmentCourse/Confirm"
        static let makePayment = "http://35.198.227.78:8000/api/v1/Patient/MakePayment"
        static let getCurrentTreatment = "patient/treatmentCourse/ViewCurrent"
    }
    
}

struct APICode {
    static let API_CODE_OK                            = "000"
    static let API_CODE_FAIL                          = "999"
    static let API_TOKEN_EXPIRE                       = "9999"
}
