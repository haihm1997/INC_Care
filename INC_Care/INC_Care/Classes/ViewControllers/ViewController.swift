//
//  ViewController.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/12/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callPHR()
    }
    
    private func apiCallDemo() {
        APIService.getTreatments().subscribe(onNext: { [weak self] response in
            print("response: \(response.data)")
        }).disposed(by: disposeBag)
    }
    
    private func callGetAllTreatmentCourse() {
        let param = ["TreatmentCourseIds": ["a81af5b7c410f8", "8d43ea4bdd79a6"]] as [String: Any]
        APIService.getAllTreatmentCourse().subscribe(onNext: { response in
            print("response result: \(response.data)")
        }).disposed(by: disposeBag)
    }
    
    private func callPHR() {
        let param = ["TreatmentCourseIds": ["142aef343f5c72", "8d43ea4bdd79a6"]]
        APIService.getPHR(param).subscribe(onNext: { response in
            print("response result: \(response.data)")
        }).disposed(by: disposeBag)
    }


}

