//
//  String + Extension.swift
//  MyCreditManager
//
//  Created by wi_seong on 2022/11/17.
//

import Foundation

extension Decimal {
    var averageString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 2
        
        return numberFormatter.string(from: self as NSDecimalNumber) ?? ""
    }
}
