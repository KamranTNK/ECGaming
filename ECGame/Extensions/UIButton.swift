//
//  UIButton.swift
//  ECGame
//
//  Created by hfcb on 1/20/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import Foundation
import CoreFoundation
import UIKit

extension UIButton {
    
    // set cornerRadius Of button
    func setCornerRadiusOfButton(cornerRadiusValue : CGFloat) {
        self.layer.cornerRadius = cornerRadiusValue
        self.clipsToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
    }
    
}
