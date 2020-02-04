//
//  CurrentBetTableViewCell.swift
//  ECGame
//
//  Created by hfcb on 1/6/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

class CurrentBetTableViewCell: UITableViewCell {

    // LET/VAR, IBOUTLETS
    @IBOutlet weak var betIDLabel: UILabel!
    @IBOutlet weak var betDetailLabel: UILabel!
    @IBOutlet weak var beAmounttLabel: UILabel!
    @IBOutlet weak var betPayoutLabel: UILabel!
    @IBOutlet weak var pendingBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
