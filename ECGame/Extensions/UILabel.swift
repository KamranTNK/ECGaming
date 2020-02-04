//
//  UILabel.swift
//  ECGame
//
//  Created by hfcb on 07/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func addPropertiesToLabel(borderColor : UIColor, borderWidth : CGFloat, bgColor : UIColor, cornerRadius : CGFloat, maskBound : Bool)  {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = maskBound
        self.backgroundColor = bgColor
    
    }
    
    func animation(typing value:String,duration: Double){
      let characters = value.map { $0 }
      var index = 0
      Timer.scheduledTimer(withTimeInterval: duration, repeats: true, block: { [weak self] timer in
          if index < value.count {
              let char = characters[index]
              self?.text! += "\(char)"
              index += 1
          } else {
              timer.invalidate()
          }
      })
    }


    func textWithAnimation(text:String,duration:CFTimeInterval){
      fadeTransition(duration)
      self.text = text
    }

    //followed from @Chris and @winnie-ru
    func fadeTransition(_ duration:CFTimeInterval) {
      let animation = CATransition()
      animation.timingFunction = CAMediaTimingFunction(name:
          CAMediaTimingFunctionName.easeInEaseOut)
      animation.type = CATransitionType.fade
      animation.duration = duration
      layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
    
}

extension UIButton {
    
    func setmultipleLineTitle(titleString : String) {
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.setTitle(titleString, for: .normal)
        self.setTitle(titleString, for: .selected)
        self.titleLabel?.textAlignment = .center
        self.sizeToFit()
    }
}
