//
//  UserDefault+.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/15/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import SwiftyUserDefaults

extension DefaultsKeys {
    static let patientUserDefault = DefaultsKey<Patient>("patient", defaultValue: Patient())
}
