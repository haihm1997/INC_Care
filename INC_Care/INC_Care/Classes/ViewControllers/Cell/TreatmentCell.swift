//
//  TreatmentCell.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/15/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import UIKit

class TreatmentCell: UITableViewCell {
    
    @IBOutlet weak var treatmentIcon: UIImageView!
    @IBOutlet weak var treatmentNameLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var incPaidAmountLabel: UILabel!
    @IBOutlet weak var remainingAmountLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    
    public static let identifier = "TreatmentCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(treatment: Treatment) {
        treatmentIcon.image = UIImage(named: treatment.treatmentIcon)
        treatmentNameLabel.text = treatment.name
        totalAmountLabel.text = "Treatment amount: \(treatment.totalAmount) $"
        incPaidAmountLabel.text = "Isurance paid amount: \(treatment.incPaidAmount) $"
        remainingAmountLabel.text = "Remaining amount: \(treatment.remainingAmount) $"
    }

}
