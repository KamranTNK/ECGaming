//
//  BetHistoryFooterViewTableViewCell.swift
//  ECGame
//
//  Created by hfcb on 1/21/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

class BetHistoryFooterViewTableViewCell: UITableViewCell {

    //MARK:- IBOutelt
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var betTotalCount: UILabel!
    @IBOutlet weak var betTotalAmount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.totalLabel.text =  CurrentBetScreen.totalString.localiz()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
