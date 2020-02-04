//
//  BetHistoryTableViewCell.swift
//  ECGame
//
//  Created by hfcb on 1/16/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

class BetHistoryTableViewCell: UITableViewCell {

    //MARK:- IBOutlet
    @IBOutlet weak var betHistoryBetId: UILabel!
    @IBOutlet weak var betHistoryDetails: UILabel!
    @IBOutlet weak var betHistoryDate: UILabel!
    @IBOutlet weak var betHistoryAmount: UILabel!
    @IBOutlet weak var betHistoryPayout: UILabel!
    
   //MARK:- Cell Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    //MARK:- Cell Selection
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
