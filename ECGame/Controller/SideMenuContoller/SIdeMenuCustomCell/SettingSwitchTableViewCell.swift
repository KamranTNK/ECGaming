//
//  SettingSwitchTableViewCell.swift
//  ECGame
//
//  Created by hfcb on 1/22/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit
import CoreFoundation


class SettingSwitchTableViewCell: UITableViewCell {

    //MARK:- IBOutlet
    @IBOutlet weak var settingTitleLabel: UILabel!
    @IBOutlet weak var switchButton: UIButton!

    //MARK:- Cell Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
    }
    override func layoutSubviews() {
       
    }

    //MARK:- Cell Selection
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
