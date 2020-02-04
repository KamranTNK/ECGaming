//
//  StockListTableViewCell.swift
//  ECGame
//
//  Created by hfcb on 1/8/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

class StockListTableViewCell: UITableViewCell {

    //MARK:- IBOutlet
    @IBOutlet weak var stockNameLabel: UILabel!
    @IBOutlet weak var stockLivePriceLabel: UILabel!
    @IBOutlet weak var stockReferenceLabel: CopyableLabel!
    
    //MARK:- Let/Var
    
    //MARK:- Cell Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    //MARK:- Cell Action
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
