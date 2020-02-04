//
//  RoadMapTableViewCell.swift
//  ECGame
//
//  Created by hfcb on 07/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

class RoadMapTableViewCell: UITableViewCell, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var roadMapCollectionView: UICollectionView!
    
    var firstDigitItemArray = [FirstDigitValues]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roadMapCollectionView.delegate = self
        roadMapCollectionView.dataSource = self
        roadMapCollectionView.register(UINib.init(nibName: RoadMapCollectionCell.className(), bundle: nil), forCellWithReuseIdentifier: RoadMapCollectionCell.className())
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


extension RoadMapTableViewCell {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (firstDigitItemArray.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoadMapCollectionCell.className(), for: indexPath) as! RoadMapCollectionCell
        
        cell.lbl1.addPropertiesToLabel(borderColor: .white, borderWidth: 0, bgColor: .white, cornerRadius: 4,  maskBound: true)
        
        cell.lbl1.text = firstDigitItemArray[indexPath.item].valueArray[0]
        cell.lbl2.text = firstDigitItemArray[indexPath.item].valueArray[1]
        cell.lbl3.text = firstDigitItemArray[indexPath.item].valueArray[2]
        cell.lbl4.text = firstDigitItemArray[indexPath.item].valueArray[3]
        cell.lbl5.text = firstDigitItemArray[indexPath.item].valueArray[4]
        cell.lbl6.text = firstDigitItemArray[indexPath.item].valueArray[5]
        
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
        
        

        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return(CGSize(width: 10, height: collectionView.frame.size.height))
    }
}
