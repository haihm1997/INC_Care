//
//  HomeViewModel.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/15/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import SwiftyJSON

class HomeViewModel: BaseViewModel {
    
    var apiStatus = Variable(APIStatus.none)
    var confirmTreatmentStatus = Variable(APIStatus.none)
    var makePaymentStatus = Variable(APIStatus.none)
    var message = ""
    var treatmentCources = TreatmentCource()
    
    let disposedBag = DisposeBag()
    var allTreatments = [Treatment]()
    
    func getTreatmentCources() {
        let param = ["patientId" : 1] as [String: Any]
        APIService.getCurrentTreatment(param).subscribe(onNext: { [weak self] response in
            if response.status.isSuccess {
                self?.treatmentCources = TreatmentCource(json: JSON(response.result!))
                self?.apiStatus.value = .success
            } else {
                self?.message = response.status.message
                self?.apiStatus.value = .failed
            }
            
        }).disposed(by: disposedBag)
    }
    
    func confirmTreatmentCource() {
        let param = [ "patientId": 1, "treatmentCourseId": treatmentCources.id] as [String : Any]
        APIService.confirmTreatmentCource(param).subscribe(onNext: { [weak self] response in
            if response.status.isSuccess {
                self?.confirmTreatmentStatus.value = .success
            } else {
                self?.message = response.status.message
                self?.confirmTreatmentStatus.value = .failed
            }
        }).disposed(by: disposedBag)
    }
    
    func makePaymentTreatment() {
        var idList = [Int]()
        for item in treatmentCources.treatmentList {
            idList.append(item.id)
        }
        let param = ["billingAndPaymentTransactionList": idList] as [String: Any]
        APIService.makePaymentTreatment(param).subscribe(onNext: { [weak self] response in
            if response.status.isSuccess {
                self?.makePaymentStatus.value = .success
            } else {
                self?.message = response.status.message
                self?.makePaymentStatus.value = .failed
            }
        }).disposed(by: disposedBag)
    }
    
}
