//
//  UIInterger.swift
//  ECGame
//
//  Created by hfcb on 20/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import Foundation

extension Int {
    func createCurrencyString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: self))!
    }
}
