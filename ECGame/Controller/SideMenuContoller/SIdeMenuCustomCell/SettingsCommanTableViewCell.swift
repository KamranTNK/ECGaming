//
//  SettingsCommanTableViewCell.swift
//  ECGame
//
//  Created by hfcb on 1/22/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

class SettingsCommanTableViewCell: UITableViewCell {

    //MARK:- IBOutlet
    @IBOutlet weak var settingTitleLabel: UILabel!
    @IBOutlet weak var settingViewButton: UIButton!
    
    //MARK:- Cell Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.settingViewButton.setTitle(SettingRow.view.localiz(), for: .normal)
        
    }

    //MARK:- Cell Selection
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
