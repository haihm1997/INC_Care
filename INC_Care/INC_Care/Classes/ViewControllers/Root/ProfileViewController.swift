//
//  ProfileViewController.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/16/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    var patient = Patient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        patient = Defaults[.patientUserDefault]
        fillData()
    }
    
    private func fillData() {
        idLabel.text = patient.id
        nameLabel.text = patient.name
        heightLabel.text = patient.height
        weightLabel.text = patient.weight
        genderLabel.text = patient.gender
        dobLabel.text = patient.dob
        adressLabel.text = patient.address
        contactLabel.text = patient.contact
    }
    
    @IBAction func getQRButtonTapped(_ sender: Any) {
        let qrVC = self.instantiateViewController(fromStoryboard: .main, ofType: QRViewController.self)
        qrVC.patientID = patient.id
        self.present(qrVC, animated: true, completion: nil)
    }
    
    
}
