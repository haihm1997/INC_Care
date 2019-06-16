//
//  APIResponse.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import Alamofire
import RxSwift
import SVProgressHUD
import SwiftyJSON

enum APIStatus: Int {
    case success = 0
    case failed = 1
    case error = 2
    case none = 3
    case empty = 4
    
    static func rawValue(_ value: Int) -> APIStatus {
        switch value {
        case 0: return .success
        case 1: return .failed
        case 2: return .error
        case 3: return .none
        case 4: return .empty
        default: return .none
        }
    }
}

struct APIResponse {
    
    var message: String = ""
    var result: Any?
    var status = CQStatus()
    var data = [[String: Any]]()
    
    init(_ response: DataResponse<Any>) {
        print("RESULTS: \(String(describing: response.result.value))")
        if let value = response.result.value as? [String: Any] {
            self.result = value["items"]
            
            if let resultNumber = value["result"] as? Int ,
                let messageResult = value["message"] as? String{
                self.status = CQStatus(result: resultNumber, message: messageResult)
            }

            if let dict = value["items"] as? [[String: Any]] {
                self.data = dict
            }
        }
        
        handlerTokenExpire()
    }
    
    init(_ error: Error) {
        SVProgressHUD.dismiss()
    }
    
    func handlerTokenExpire() {
        if let value = self.result as? [String: Any],
            let message = value["Message"] as? String {
            SVProgressHUD.dismiss()
        }
    }
}

struct CQStatus {
    
    var code = 0
    var message = ""
    var method = ""
    var path = ""
    var codeStr = ""
    
    init() {
        
    }
    
    init(result: Int, message: String) {
        self.code = result
        self.message = message
    }
    
    var isSuccess: Bool {
        return code == 200 || codeStr == "SUCCESS"
    }
}

