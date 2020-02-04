//
//  UIView.swift
//  Dummy
//
//  Created by Dummy on 14/6/19.
//  Copyright © 2019 Dummy. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /// set shadow along all sides of view
    func setShadowOverView(widthOffset: CGFloat, heightOffset: CGFloat, color: UIColor, opacityValue: Float, shadowRadiusValue : CGFloat) {
        self.clipsToBounds = false
        let shadowLayer = self.layer
        shadowLayer.shadowOffset = CGSize(width: widthOffset, height: heightOffset)
        shadowLayer.shadowColor = color.cgColor
        shadowLayer.shadowOpacity = opacityValue
        shadowLayer.shadowRadius = shadowRadiusValue
    }
    
    // set cornerRadius Of view
    func setCornerRadiusOfView(cornerRadiusValue : CGFloat) {
        self.layer.cornerRadius = cornerRadiusValue
        self.clipsToBounds = true
    }
    
    func setShadowOnAllSidesOfView(shadowSizeValue: CGFloat) {
        let shadowSize : CGFloat = shadowSizeValue
        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                   y: -shadowSize / 2,
                                                   width: self.frame.size.width + shadowSize,
                                                   height: self.frame.size.height + shadowSize))
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowPath = shadowPath.cgPath
    }
    
}
//Class ends here
