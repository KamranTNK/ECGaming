//
//  PreviewTableCell.swift
//  ECGame
//
//  Created by hfcb on 27/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

class PreviewTableCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    
    @IBOutlet weak var numberCollectionView: UICollectionView!
    @IBOutlet weak var bigSmallCollectionView: UICollectionView!
    @IBOutlet weak var evenOddCollectionView: UICollectionView!
    @IBOutlet weak var upmidhighCollectionView: UICollectionView!
    
     //Model objects
    var collectionDataArray = [FirstDigitItems]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        numberCollectionView.layer.borderColor = UIColor.white.cgColor
        numberCollectionView.layer.borderWidth =  2
        bigSmallCollectionView.layer.borderColor = UIColor.white.cgColor
        bigSmallCollectionView.layer.borderWidth =  2
        evenOddCollectionView.layer.borderColor = UIColor.white.cgColor
        evenOddCollectionView.layer.borderWidth =  2
        upmidhighCollectionView.layer.borderColor = UIColor.white.cgColor
        upmidhighCollectionView.layer.borderWidth =  2
        
        numberCollectionView.delegate = self
        numberCollectionView.dataSource = self
        numberCollectionView.register(UINib.init(nibName: PreviewRoadmapCollectionCell.className(), bundle: nil), forCellWithReuseIdentifier: PreviewRoadmapCollectionCell.className())
        
        bigSmallCollectionView.delegate = self
        bigSmallCollectionView.dataSource = self
        bigSmallCollectionView.register(UINib.init(nibName: PreviewRoadmapCollectionCell.className(), bundle: nil), forCellWithReuseIdentifier: PreviewRoadmapCollectionCell.className())
        
        evenOddCollectionView.delegate = self
        evenOddCollectionView.dataSource = self
        evenOddCollectionView.register(UINib.init(nibName: PreviewRoadmapCollectionCell.className(), bundle: nil), forCellWithReuseIdentifier: PreviewRoadmapCollectionCell.className())
        
        upmidhighCollectionView.delegate = self
        upmidhighCollectionView.dataSource = self
        upmidhighCollectionView.register(UINib.init(nibName: PreviewRoadmapCollectionCell.className(), bundle: nil), forCellWithReuseIdentifier: PreviewRoadmapCollectionCell.className())
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension PreviewTableCell {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == numberCollectionView {
            return collectionDataArray[3].itemArray!.count
        } else if collectionView == bigSmallCollectionView {
            return collectionDataArray[0].itemArray!.count
        } else if collectionView == evenOddCollectionView {
            return collectionDataArray[1].itemArray!.count
        } else if collectionView == upmidhighCollectionView {
            return collectionDataArray[2].itemArray!.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewRoadmapCollectionCell.className(), for: indexPath) as! PreviewRoadmapCollectionCell
        
       
        if collectionView == numberCollectionView {
            cell.lbl1.text = collectionDataArray[3].itemArray?[indexPath.item].valueArray[0]
            cell.lbl2.text = collectionDataArray[3].itemArray?[indexPath.item].valueArray[1]
            cell.lbl3.text = collectionDataArray[3].itemArray?[indexPath.item].valueArray[2]
            cell.lbl4.text = collectionDataArray[3].itemArray?[indexPath.item].valueArray[3]
            cell.lbl5.text = collectionDataArray[3].itemArray?[indexPath.item].valueArray[4]
            cell.lbl6.text = collectionDataArray[3].itemArray?[indexPath.item].valueArray[5]
            
        } else if collectionView == bigSmallCollectionView {
            cell.lbl1.text = collectionDataArray[0].itemArray![indexPath.item].valueArray[0]
            cell.lbl2.text = collectionDataArray[0].itemArray![indexPath.item].valueArray[1]
            cell.lbl3.text = collectionDataArray[0].itemArray![indexPath.item].valueArray[2]
            cell.lbl4.text = collectionDataArray[0].itemArray![indexPath.item].valueArray[3]
            cell.lbl5.text = collectionDataArray[0].itemArray![indexPath.item].valueArray[4]
            cell.lbl6.text = collectionDataArray[0].itemArray![indexPath.item].valueArray[5]
             
        } else if collectionView == evenOddCollectionView {
            cell.lbl1.text = collectionDataArray[1].itemArray![indexPath.item].valueArray[0]
            cell.lbl2.text = collectionDataArray[1].itemArray![indexPath.item].valueArray[1]
            cell.lbl3.text = collectionDataArray[1].itemArray![indexPath.item].valueArray[2]
            cell.lbl4.text = collectionDataArray[1].itemArray![indexPath.item].valueArray[3]
            cell.lbl5.text = collectionDataArray[1].itemArray![indexPath.item].valueArray[4]
            cell.lbl6.text = collectionDataArray[1].itemArray![indexPath.item].valueArray[5]
            
        } else if collectionView == upmidhighCollectionView {
            cell.lbl1.text = collectionDataArray[2].itemArray![indexPath.item].valueArray[0]
            cell.lbl2.text = collectionDataArray[2].itemArray![indexPath.item].valueArray[1]
            cell.lbl3.text = collectionDataArray[2].itemArray![indexPath.item].valueArray[2]
            cell.lbl4.text = collectionDataArray[2].itemArray![indexPath.item].valueArray[3]
            cell.lbl5.text = collectionDataArray[2].itemArray![indexPath.item].valueArray[4]
            cell.lbl6.text = collectionDataArray[2].itemArray![indexPath.item].valueArray[5]
             
        } else {
            cell.lbl1.text = ""
            cell.lbl2.text = ""
            cell.lbl3.text = ""
            cell.lbl4.text = ""
            cell.lbl5.text = ""
            cell.lbl6.text = ""
        }
        
        if collectionView == numberCollectionView {
            cell.lbl1.addPropertiesToLabel(borderColor: .black, borderWidth: 0, bgColor: .white, cornerRadius: 5,  maskBound: true)
            cell.lbl2.addPropertiesToLabel(borderColor: .black, borderWidth: 0, bgColor: .white, cornerRadius: 5,  maskBound: true)
            cell.lbl3.addPropertiesToLabel(borderColor: .black, borderWidth: 0, bgColor: .white, cornerRadius: 5,  maskBound: true)
            cell.lbl4.addPropertiesToLabel(borderColor: .black, borderWidth: 0, bgColor: .white, cornerRadius: 5,  maskBound: true)
            cell.lbl5.addPropertiesToLabel(borderColor: .black, borderWidth: 0, bgColor: .white, cornerRadius: 5,  maskBound: true)
            cell.lbl6.addPropertiesToLabel(borderColor: .black, borderWidth: 0, bgColor: .white, cornerRadius: 5,  maskBound: true)
        } else {
            if indexPath.item%2==0 {
                  if cell.lbl1.text == "" {
                      cell.lbl1.addPropertiesToLabel(borderColor: .white, borderWidth: 0, bgColor: .white, cornerRadius: 4,  maskBound: true)
                  } else {
                      cell.lbl1.addPropertiesToLabel(borderColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapGreenColor), borderWidth: 0, bgColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapGreenColor), cornerRadius: 4,  maskBound: true)
                  }
                  
                  if cell.lbl2.text == "" {
                      cell.lbl2.addPropertiesToLabel(borderColor: .white, borderWidth: 0, bgColor: .white, cornerRadius: 4,  maskBound: true)
                  } else {
                      cell.lbl2.addPropertiesToLabel(borderColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapGreenColor), borderWidth: 0, bgColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapGreenColor), cornerRadius: 4,  maskBound: true)
                  }
                  
                  if cell.lbl3.text == "" {
                      cell.lbl3.addPropertiesToLabel(borderColor: .white, borderWidth: 0, bgColor: .white, cornerRadius: 4,  maskBound: true)
                  } else {
                      cell.lbl3.addPropertiesToLabel(borderColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapGreenColor), borderWidth: 0, bgColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapGreenColor), cornerRadius: 4,  maskBound: true)
                  }
                  
                  if cell.lbl4.text == "" {
                      cell.lbl4.addPropertiesToLabel(borderColor: .white, borderWidth: 0, bgColor: .white, cornerRadius: 4,  maskBound: true)
                  } else {
                      cell.lbl4.addPropertiesToLabel(borderColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapGreenColor), borderWidth: 0, bgColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapGreenColor), cornerRadius: 4,  maskBound: true)
                  }
                  
                  if cell.lbl5.text == "" {
                      cell.lbl5.addPropertiesToLabel(borderColor: .white, borderWidth: 0, bgColor: .white, cornerRadius: 4,  maskBound: true)
                  } else {
                      cell.lbl5.addPropertiesToLabel(borderColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapGreenColor), borderWidth: 0, bgColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapGreenColor), cornerRadius: 4,  maskBound: true)
                  }
                  
                  if cell.lbl6.text == "" {
                     cell.lbl6.addPropertiesToLabel(borderColor: .white, borderWidth: 0, bgColor: .white, cornerRadius: 4,  maskBound: true)
                 } else {
                     cell.lbl6.addPropertiesToLabel(borderColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapGreenColor), borderWidth: 0, bgColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapGreenColor), cornerRadius: 4,  maskBound: true)
                 }
                  
              } else {
                   if cell.lbl1.text == "" {
                     cell.lbl1.addPropertiesToLabel(borderColor: .white, borderWidth: 0, bgColor: .white, cornerRadius: 4,  maskBound: true)
                 } else {
                     cell.lbl1.addPropertiesToLabel(borderColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapRedColor), borderWidth: 0, bgColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapRedColor), cornerRadius: 4,  maskBound: true)
                 }
                 
                 if cell.lbl2.text == "" {
                     cell.lbl2.addPropertiesToLabel(borderColor: .white, borderWidth: 0, bgColor: .white, cornerRadius: 4,  maskBound: true)
                 } else {
                     cell.lbl2.addPropertiesToLabel(borderColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapRedColor), borderWidth: 0, bgColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapRedColor), cornerRadius: 4,  maskBound: true)
                 }
                 
                 if cell.lbl3.text == "" {
                     cell.lbl3.addPropertiesToLabel(borderColor: .white, borderWidth: 0, bgColor: .white, cornerRadius: 4,  maskBound: true)
                 } else {
                     cell.lbl3.addPropertiesToLabel(borderColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapRedColor), borderWidth: 0, bgColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapRedColor), cornerRadius: 4,  maskBound: true)
                 }
                 
                 if cell.lbl4.text == "" {
                     cell.lbl4.addPropertiesToLabel(borderColor: .white, borderWidth: 0, bgColor: .white, cornerRadius: 4,  maskBound: true)
                 } else {
                     cell.lbl4.addPropertiesToLabel(borderColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapRedColor), borderWidth: 0, bgColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapRedColor), cornerRadius: 4,  maskBound: true)           }
                 
                 if cell.lbl5.text == "" {
                     cell.lbl5.addPropertiesToLabel(borderColor: .white, borderWidth: 0, bgColor: .white, cornerRadius: 4,  maskBound: true)
                 } else {
                     cell.lbl5.addPropertiesToLabel(borderColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapRedColor), borderWidth: 0, bgColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapRedColor), cornerRadius: 4,  maskBound: true)
                 }
                 
                 if cell.lbl6.text == "" {
                    cell.lbl6.addPropertiesToLabel(borderColor: .white, borderWidth: 0, bgColor: .white, cornerRadius: 4,  maskBound: true)
                } else {
                    cell.lbl6.addPropertiesToLabel(borderColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapRedColor), borderWidth: 0, bgColor: CommonMethods.hexStringToUIColor(hex: Color.roadmapRedColor), cornerRadius: 4,  maskBound: true)
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return(CGSize(width: 10, height: collectionView.frame.size.height))
    }
}
