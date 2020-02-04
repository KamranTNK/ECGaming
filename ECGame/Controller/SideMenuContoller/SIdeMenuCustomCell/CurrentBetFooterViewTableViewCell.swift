//
//  CurrentBetFooterViewTableViewCell.swift
//  ECGame
//
//  Created by hfcb on 1/20/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

class CurrentBetFooterViewTableViewCell: UITableViewCell {

    //MARK:- IBOutlet
    @IBOutlet weak var totalCurrentBetLabel: UILabel!
    @IBOutlet weak var totalCurrentBetAmountLabel: UILabel!
    @IBOutlet weak var totalTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
