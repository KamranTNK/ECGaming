//
//  CustomImageView.swift
//  ECGame
//
//  Created by hfcb on 1/15/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

@IBDesignable class CustomImageView:UIImageView {
    @IBInspectable var borderColor:UIColor = UIColor.white {
        willSet {
            layer.borderColor = newValue.cgColor
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = borderColor.cgColor
    }
}

