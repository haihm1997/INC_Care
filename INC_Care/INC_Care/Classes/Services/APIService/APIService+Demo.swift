//
//  APIService+Demo.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/14/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import Alamofire
import RxSwift
import RxAlamofire

class DemoRouter: BaseRequest {
    
    enum EndPoint {
        case demo
        case getAllTreatments
        case getPHR([String: Any])
    }
    
    var endPoint: EndPoint
    
    init(endPoint: EndPoint) {
        self.endPoint = endPoint
    }
    
    override var method: HTTPMethod {
        switch endPoint {
        case .demo:
            return .get
        case .getAllTreatments:
            return .post
        case .getPHR:
            return .post
        }
    }
    
    override var path: String {
        switch endPoint {
        case .demo:
            return Address.Demo.getAllTreatment
        case .getAllTreatments:
            return Address.Demo.getAllTreatmentCourse
        case .getPHR:
            return Address.Demo.getPHR
        }
    }
    
    override var parameters: [String : Any] {
        switch endPoint {
        case .getAllTreatments:
            return [String: Any]()
        case .demo:
            return [String: Any]()
        case .getPHR(let param):
            return param
        }
    }
    
}

extension APIService {
    
    static func getTreatments() -> Observable<APIResponse> {
        return request(DemoRouter(endPoint: .demo))
    }
    
    static func getAllTreatmentCourse() -> Observable<APIResponse> {
        return request(DemoRouter(endPoint: .getAllTreatments))
    }
    
    static func getPHR(_ param: [String: Any]) -> Observable<APIResponse> {
        return request(DemoRouter(endPoint: .getPHR(param)))
    }
}
