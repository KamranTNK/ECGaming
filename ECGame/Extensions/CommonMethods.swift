//
//  CommonMethods.swift
//  Dummy
//
//  Created by Dummy on 14/6/19..
//  Copyright © 2019 Dummy. All rights reserved.
//

import UIKit

@objc class CommonMethods: NSObject {
    
    //Showing popup on window
    class func showPopUpWithVibrancyView(controller : AnyObject) -> Array<UIVisualEffectView> {
        var vibrantView = UIVisualEffectView(),effectView = UIVisualEffectView()
        let blur: UIBlurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        // create vibrancy effect
        let vibrancy: UIVibrancyEffect = UIVibrancyEffect(blurEffect: blur)
        // add blur to an effect view
        effectView = UIVisualEffectView(effect: blur)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        effectView.frame =  (appDelegate.window?.frame)!
        // add vibrancy to yet another effect view
        vibrantView = UIVisualEffectView(effect: vibrancy)
        vibrantView.frame =  (appDelegate.window?.frame)!
        vibrantView.alpha = 0.5
        effectView.alpha = 0.5
        if (controller.isKind(of: UIViewController.self)) {
            (controller as! UIViewController).view.window?.addSubview(vibrantView)
            (controller as! UIViewController).view.window?.addSubview(effectView)
        } else if (controller.isKind(of: UIView.self)){
            (controller as! UIView).window?.addSubview(vibrantView)
            (controller as! UIView).window?.addSubview(effectView)
        }
        let viewArray = Array(arrayLiteral: vibrantView,effectView)
        return viewArray
    }
    
    class func hideblurView (vibrantView: UIVisualEffectView, effectView: UIVisualEffectView) {
        vibrantView.removeFromSuperview()
        effectView.removeFromSuperview()
    }
    
    /// Get Random Color
    ///
    /// - Returns: random Color
    class func getRandomColor() -> UIColor {
        return UIColor.init(red: (CGFloat(arc4random_uniform(255))/255.0), green: (CGFloat(arc4random_uniform(255))/255.0), blue: (CGFloat(arc4random_uniform(255))/255.0), alpha: 1)
    }
    
    /// Get symbol from Text
    /// - Parameter name: name for which text symbol is to be generated
    /// - Returns: text symbol
    class func getTextSymbols(from name: String) -> String {
        // Trimming extra white spaces and dividing Name on the basis of " "
        let arrayOfNameSubParts = name.trimmingCharacters(in: NSCharacterSet.whitespaces).components(separatedBy: " ")
        if (arrayOfNameSubParts.count > 0) {
            
            // Get Initial Letters from Name(which are separated by space)
            var logoString = ""
            
            // If Name is having only one subpart, then show starting two letters of that part
            if (arrayOfNameSubParts.count == 1) {
                let initialTwoLetters = name.prefix(1)
                logoString += initialTwoLetters.uppercased()
            }else {
                
                // If Name is having more than one subpart, then show starting one letter of initial two subparts
                for (index, substrings) in arrayOfNameSubParts.enumerated() {
                    logoString += String.init(describing: substrings.first!).uppercased()
                    if (index == 1) {
                        break
                    }
                }
            }
            return logoString
        }
        return ""
    }
    
    
    /* This is a function that takes a hex string and returns a UIColor.
     (You can enter hex strings with either format: #ffffff or ffffff)
     Usage: var color1 = hexStringToUIColor("#d3d3d3") */
    /// - Parameter hex: Hex String
    /// - Returns: The Value of UIColor
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0))
    }
}

extension Date {
    var timeStamp: UInt64 {
        return UInt64((self.timeIntervalSince1970 + 62_135_596_800) * 10_000_000)
    }
}
//Class ends here



