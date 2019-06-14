//
//  APIConfigs.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

struct Address {
    
    static let baseUrl = "https://healthcare-dapp.akachains.io/api/v1/"
    
    struct Authen {
        static let login        =   "login"
    }
    
    struct Demo {
        static let getAllTreatment = "v1/getAllTreatmentTrans"
        static let getAllTreatmentCourse = "Patient/TreatmentCourse/GetAll"
        static let getPHR = "Patient/TreatmentCourse/ViewCurrentCourse"
        static let getViewCurrent = "Patient/TreatmentCourse/ViewCurrentCourse"
    }
    
}

struct APICode {
    static let API_CODE_OK                            = "000"
    static let API_CODE_FAIL                          = "999"
    static let API_TOKEN_EXPIRE                       = "9999"
}
