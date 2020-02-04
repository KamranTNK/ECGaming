//
//  NSObject.swift
//  Dummy
//
//  Created by Dummy on 14/6/19.
//  Copyright © 2019 Dummy. All rights reserved.
//

import Foundation

extension NSObject {
    
    /// Get class name string
    ///
    /// - Returns: name of class
    class func className() -> String {
        return String(describing: self)
    }
}

extension String {
    /// Check for valid contact
    var isValidContact: Bool {
        let phoneNumberRegex = "^[6-9]\\d{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let isValidPhone = phoneTest.evaluate(with: self)
        return isValidPhone
    }
    
    /// Check for vaild email
    ///
    /// - Returns: true or false
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
//Class ends here
