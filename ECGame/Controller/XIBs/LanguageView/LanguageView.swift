//
//  LanguageView.swift
//  ECGame
//
//  Created by hfcb on 23/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

class LanguageView: UIView {

    //MARK:- OUtlets
    // Language selection buttons to change language of the application
    @IBOutlet weak var usaBtn: UIButton!
    @IBOutlet weak var chinaBtn: UIButton!
    @IBOutlet weak var laosBtn: UIButton!
    @IBOutlet weak var thaiBtn: UIButton!
    
    //MARK:- Variables and constents
    //Languagepopup view delegate to change language request
    var languageDelegate : LanguageDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
 
    //MARK:- Button Actions
    
    @IBAction func chnageLanguageAction(_ sender: UIButton) {
        self.languageDelegate?.changeSelectedLanguage(selectedLanguageIndex: sender.tag)
        self.removeFromSuperview()
    }
    
    @IBAction func closeLanguageSelectionAction(_ sender: Any) {
        self.removeFromSuperview()
    }
    
}
