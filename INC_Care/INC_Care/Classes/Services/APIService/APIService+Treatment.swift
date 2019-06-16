//
//  APIService+Treatment.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/16/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire

class TreatmentRouter: BaseRequest {
    enum EndPoint {
        case getTreatmentCources([String: Any])
        case confirmTreatmentCourse([String: Any])
        case makePayment([String: Any])
        case getCurrentTreatment([String: Any])
    }
    
    var endPoint: EndPoint
    
    init(endPoint: EndPoint) {
        self.endPoint = endPoint
    }
    
    override var method: HTTPMethod {
        switch endPoint {
        case .getTreatmentCources:
            return .post
        case .confirmTreatmentCourse:
            return .post
        case .makePayment:
            return .post
        case .getCurrentTreatment:
            return .post
        }
    }
    
    override var path: String {
        switch endPoint {
        case .getTreatmentCources:
            return Address.Treatment.getAllTreatmentCources
        case .confirmTreatmentCourse:
            return Address.Treatment.confirmTreatmentCource
        case .makePayment:
            return Address.Treatment.makePayment
        case .getCurrentTreatment:
            return Address.Treatment.getCurrentTreatment
        }
    }
    
    override var parameters: [String : Any] {
        switch endPoint {
        case .getTreatmentCources(let param):
            return param
        case .confirmTreatmentCourse(let param):
            return param
        case .makePayment(let param):
            return param
        case .getCurrentTreatment(let param):
            return param
        }
    }
}

extension APIService {
    static func getAllTreatmentCources(_ param: [String: Any]) -> Observable<APIResponse> {
        return request(TreatmentRouter(endPoint: .getTreatmentCources(param)))
    }
    
    static func confirmTreatmentCource(_ param: [String: Any]) -> Observable<APIResponse> {
        return request(TreatmentRouter(endPoint: .confirmTreatmentCourse(param)))
    }
    
    static func makePaymentTreatment(_ param: [String: Any]) -> Observable<APIResponse> {
        return request(TreatmentRouter(endPoint: .makePayment(param)))
    }
    
    static func getCurrentTreatment(_ param: [String: Any]) -> Observable<APIResponse> {
        return request(TreatmentRouter(endPoint: .getCurrentTreatment(param)))
    }
}
