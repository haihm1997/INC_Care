//
//  ConfirmCell.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/16/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import UIKit

class ConfirmCell: UITableViewCell {
    
    static let identified = "ConfirmCell"
    var delegate: ConfirmProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        delegate?.onConfirmButtonTapped()
    }
    
}

protocol ConfirmProtocol: class {
    
    func onConfirmButtonTapped()
    
}
