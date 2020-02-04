//
//  SettingsSegmentTableViewCell.swift
//  ECGame
//
//  Created by hfcb on 1/22/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

class SettingsSegmentTableViewCell: UITableViewCell {

    //MARK:- IBOutlet
    @IBOutlet weak var settingTitleLabel: UILabel!
    @IBOutlet weak var everyoneBtn: UIButton!
    @IBOutlet weak var ononeBtn: UIButton!
    @IBOutlet weak var segmentImageView: UIImageView!
    
    
    //MARK:- Cell Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.everyoneBtn.setTitle(SettingRow.everyOne.localiz(), for: .normal)
        self.ononeBtn.setTitle(SettingRow.noOne.localiz(), for: .normal)

    }

    //MARK:- Cell Selection
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
