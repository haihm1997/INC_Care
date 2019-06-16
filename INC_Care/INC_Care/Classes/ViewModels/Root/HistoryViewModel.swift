//
//  HistoryViewModel.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/16/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import UIKit
import RxSwift
import SwiftyJSON

class HistoryViewModel: BaseViewModel {
    
    var hisTreatmentCourse = [TreatmentCource]()
    var apiStatus = Variable(APIStatus.none)
    var message = ""
    
    func getTreatmentCources() {
        let param = ["patientId" : 1] as [String: Any]
        APIService.getAllTreatmentCources(param).subscribe(onNext: { [weak self] response in
            if response.status.isSuccess {
                self?.hisTreatmentCourse = response.data.map({ TreatmentCource(json: JSON($0))})
                self?.apiStatus.value = .success
            } else {
                self?.message = response.status.message
                self?.apiStatus.value = .failed
            }
            
        }).disposed(by: disposeBag)
    }
    
}
