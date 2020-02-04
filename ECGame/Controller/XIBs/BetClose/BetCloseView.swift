//
//  RoadMapView.swift
//  ECGame
//
//  Created by hfcb on 06/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit


class BetCloseView: UIView {
    
    //MARK:- IBOutlet
    @IBOutlet weak var closeLbl: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        self.closeLbl.text = AlertField.betClosedString.localiz()
    }
}
