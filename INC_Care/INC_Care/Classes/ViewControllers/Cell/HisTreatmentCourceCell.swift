//
//  HisTreatmentCourceCell.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/16/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import UIKit

class HisTreatmentCourceCell: UITableViewCell {

    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var hospitalNameLabel: UILabel!
    @IBOutlet weak var treatmentCountLabel: UILabel!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var checkinLabel: UILabel!
    @IBOutlet weak var checkoutLabel: UILabel!
    
    static let identified = "HisTreatmentCourceCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configView(_ treatmentCource: TreatmentCource) {
        statusImage.image = treatmentCource.insurancePaidStatus ? UIImage(named: "ic_accept") : UIImage(named: "cancel")
        hospitalNameLabel.text = treatmentCource.hospitalName
        treatmentCountLabel.text = "\(treatmentCource.treatmentList.count)"
        totalBillLabel.text = "\(treatmentCource.totalTreatmentBuillAmount)"
        checkinLabel.text = treatmentCource.checkinTime
        checkoutLabel.text = treatmentCource.checkOutTime
    }

}
