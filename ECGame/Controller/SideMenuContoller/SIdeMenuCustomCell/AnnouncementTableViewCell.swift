//
//  AnnouncementTableViewCell.swift
//  ECGame
//
//  Created by hfcb on 1/8/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

class AnnouncementTableViewCell: UITableViewCell {

    //MARK:- IBOutlet
    @IBOutlet weak var announcementTitle: UILabel!
    @IBOutlet weak var announcementPreview: UILabel!
    @IBOutlet weak var announcementDate: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
