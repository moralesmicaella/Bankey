//
//  DecimalUtil.swift
//  Bankey
//
//  Created by Micaella Morales on 3/25/22.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
