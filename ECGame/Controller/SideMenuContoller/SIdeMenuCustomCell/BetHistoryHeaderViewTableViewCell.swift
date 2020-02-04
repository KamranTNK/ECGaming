//
//  BetHistoryHeaderViewTableViewCell.swift
//  ECGame
//
//  Created by hfcb on 1/17/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

class BetHistoryHeaderViewTableViewCell: UITableViewCell {

    //MARK:- IBOutlet
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var betHistoryBetId: UILabel!
    @IBOutlet weak var betHistoryDetails: UILabel!
    @IBOutlet weak var betHistoryDate: UILabel!
    @IBOutlet weak var betHistoryAmount: UILabel!
    @IBOutlet weak var betHistoryPayout: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.betHistoryBetId.text = CurrentBetScreen.betIdString.localiz()
        self.betHistoryDetails.text =  CurrentBetScreen.betDetailsString.localiz()
        self.betHistoryDate.text = BetHistoryScreen.betHistoryTimeString.localiz()
        self.betHistoryAmount.text =  CurrentBetScreen.amountString.localiz()
        self.betHistoryPayout.text =  CurrentBetScreen.payoutString.localiz()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if #available(iOS 11.0, *){
            headerView.clipsToBounds = false
            headerView.layer.cornerRadius = 15
            headerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }else{
            let rectShape = CAShapeLayer()
            rectShape.bounds = headerView.frame
            rectShape.position = headerView.center
            rectShape.path = UIBezierPath(roundedRect: headerView.bounds,    byRoundingCorners: [.topLeft , .topRight], cornerRadii: CGSize(width: 20, height: 20)).cgPath
            headerView.layer.mask = rectShape
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
