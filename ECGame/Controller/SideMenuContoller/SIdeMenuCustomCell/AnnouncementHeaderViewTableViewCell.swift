//
//  AnnouncementHeaderViewTableViewCell.swift
//  ECGame
//
//  Created by hfcb on 1/18/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

class AnnouncementHeaderViewTableViewCell: UITableViewCell {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var anounceTitle: UILabel!
    @IBOutlet weak var previewTitle: UILabel!
    @IBOutlet weak var dateTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
