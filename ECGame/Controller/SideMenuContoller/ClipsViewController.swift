//
//  ClipsViewController.swift
//  ECGame
//
//  Created by hfcb on 1/13/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

class ClipsViewController: UIViewController {

    //MARK:- IBOutlet
    @IBOutlet weak var chipsHeaderTitle: UILabel!
    @IBOutlet weak var dangerChipLabel: UILabel!
    @IBOutlet weak var primaryChipLabel: UILabel!
    @IBOutlet weak var successChipLabel: UILabel!
    @IBOutlet weak var warningChipLabel: UILabel!
    @IBOutlet weak var blackChipLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.chipsHeaderTitle.text = SettingRow.chips.localiz().uppercased()
        self.dangerChipLabel.text = chips.dangerChipString.localiz()
        self.primaryChipLabel.text = chips.primaryChipString.localiz()
        self.successChipLabel.text = chips.successChipString.localiz()
        self.warningChipLabel.text = chips.warningChipString.localiz()
        self.blackChipLabel.text = chips.blackChipString.localiz()
        
    }
    @IBAction func OnClickBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
}
