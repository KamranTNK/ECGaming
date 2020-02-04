//
//  RoadMapView.swift
//  ECGame
//
//  Created by hfcb on 06/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit


class RoadMapView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    //MARK:- IBOutlet
    
    //roadmapview selection buttons to view type of roadmap such as big, smaal,even, odd etc
    @IBOutlet weak var roadMapTableView: UITableView!
    @IBOutlet weak var firstDigitBtn: UIButton!
    @IBOutlet weak var lstDigitBtn: UIButton!
    @IBOutlet weak var twoDigitBtn: UIButton! //two
    @IBOutlet weak var bothDigitBtn: UIButton! //sum
    
    //labels to displa data on roadmapview
    @IBOutlet weak var lastDrawTitleLbl: UILabel!
    @IBOutlet weak var winningsTitleLbl: UILabel!
    @IBOutlet weak var userTitleLbl: UILabel!
    @IBOutlet weak var resultTitleLbl: UILabel!
    @IBOutlet weak var lastDrawLbl: UILabel!
    @IBOutlet weak var winningsLbl: UILabel!
    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var bottomTableViewContraint: NSLayoutConstraint!
    
    //Stackview
    @IBOutlet weak var buttonsStackView: UIStackView!
    @IBOutlet weak var labelsStackView: UIStackView!
    
    //MARK:- Variables
    //Roadmap view delegate to manage expand/collapse
    var roadMaoDelegate : RoadMapDelegate?
    //default state of roadmap view
    var isExpandedRoadMap = Bool()
    //Model objects
    var firstDigitTableArray = [FirstDigitItems]()
    //UIBuuton Array to change the opicity of buttons
    
    var buttonArray = [UIButton]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadInitialView()
    }
    
    //MARK: - Initial
    func loadInitialView() {
        //Table view delegate and datasource
        roadMapTableView.delegate = self
        roadMapTableView.dataSource = self
        
        //Register XIB to the tableView
        roadMapTableView.register(UINib(nibName: RoadMapTableViewCell.className(), bundle: nil), forCellReuseIdentifier: RoadMapTableViewCell.className())
        
        //Remove extra cells from tableView
        roadMapTableView.tableFooterView = UIView()
        
        //Set properties to labels
        lastDrawLbl.addPropertiesToLabel(borderColor: .clear, borderWidth: 0, bgColor: .white, cornerRadius: 5, maskBound: true)
        winningsLbl.addPropertiesToLabel(borderColor: .clear, borderWidth: 0, bgColor: .white, cornerRadius: 5, maskBound: true)
        userLbl.addPropertiesToLabel(borderColor: .clear, borderWidth: 0, bgColor: .white, cornerRadius: 5, maskBound: true)
        resultLbl.addPropertiesToLabel(borderColor: .clear, borderWidth: 0, bgColor: .white, cornerRadius: 5, maskBound: true)
        
        //Button and Title
        firstDigitBtn.setTitle(buttonTitle.roadmapfirstDigitString.localiz(), for: .normal)
        lstDigitBtn.setTitle(buttonTitle.roadmaplastDigitString.localiz(), for: .normal)
        twoDigitBtn.setTitle(buttonTitle.roadmaptwoDigitString.localiz(), for: .normal)
        bothDigitBtn.setTitle(buttonTitle.roadmapbothDigitString.localiz(), for: .normal)
        lastDrawTitleLbl.text = buttonTitle.rmLastDrawTitleString.localiz()
        winningsTitleLbl.text = buttonTitle.rmTotalWiningTitletString.localiz()
        userTitleLbl.text = buttonTitle.rmNoOfuserTitleString.localiz()
        resultTitleLbl.text = buttonTitle.rmResultsTitleString.localiz()
        
        //Set default componenet when load map view
        labelsStackView.isHidden = true
        
        // 
        buttonArray.append( firstDigitBtn)
        buttonArray.append( lstDigitBtn)
        buttonArray.append( twoDigitBtn)
        buttonArray.append( bothDigitBtn)
        firstDigitBtn.isSelected = true
        firstDigitBtn.isUserInteractionEnabled = false
    }
    
    @IBAction func changeRoadmapWithSelectdTypeAction(_ sender: UIButton) {
        for button in buttonArray {
            if button.tag == sender.tag {
                button.isSelected = true
                button.isUserInteractionEnabled = false
            } else {
                button.isSelected = false
                button.isUserInteractionEnabled = true
            }
        }
        roadMaoDelegate?.refreshDataofRoadmapWithSelecetedType(type: sender.tag)
    }
    
}
  

extension RoadMapView {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstDigitTableArray.count
       }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = roadMapTableView.dequeueReusableCell(withIdentifier: RoadMapTableViewCell.className()) as? RoadMapTableViewCell
           if cell == nil {
            roadMapTableView.register(UINib(nibName: RoadMapTableViewCell.className(), bundle: nil), forCellReuseIdentifier: RoadMapTableViewCell.className())
           }
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        cell?.roadMapCollectionView.addGestureRecognizer(tap)
        cell?.firstDigitItemArray = firstDigitTableArray[indexPath.row].itemArray!
        cell?.roadMapCollectionView.reloadData()
        return cell!
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        if isExpandedRoadMap {
            isExpandedRoadMap = false
            labelsStackView.isHidden = true
        } else {
            isExpandedRoadMap = true
            labelsStackView.isHidden = false
        }
        self.roadMaoDelegate?.toggleRoadMapView(isRoadmapExpanded: isExpandedRoadMap)
    }
}
