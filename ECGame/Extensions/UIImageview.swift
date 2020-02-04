//
//  UIImageview.swift
//  Apptive Learn
//
//  Created by Dummy on 14/6/19.
//  Copyright © 2019 Dummy. All rights reserve
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    /// Set Image from server url
    ///
    /// - Parameter urlString: server url
    func setImage(with urlString: String){
        guard let url = URL.init(string: urlString) else {return}
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        var kf = self.kf
        kf.indicatorType = .activity
        let image = UIImage(named: "")
        self.kf.setImage(with:resource, placeholder : image)
    }
}
//Class ends here
