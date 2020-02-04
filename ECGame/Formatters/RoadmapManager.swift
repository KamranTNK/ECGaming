//
//  RoadmapManager.swift
//  ECGame
//
//  Created by hfcb on 28/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

class RoadmapManager: NSObject {

    
    //To get number of elemts from end to any  array
  class func getLastElements<U>(array: [U], count: Int) -> [U] {
      if count >= array.count {
        return array
      }
      let first = array.count - count
      return Array(array[first..<first+count])
    }

    
    //To get data from api and manage RoadmapObject
    class func createGridArrayForRoadmap(roadmapDataArray : [RoadmapDataObjectModel], withSelectedRoadmapType type : Int )-> [FirstDigitItems] {
       
         let jsonString = roadmapDataArray.toJSONString(prettyPrint: true)
         print(jsonString as AnyObject)
         
         var itemAtIndex = 0
         var limForBig = 0
         var limForUp = 0
         var limForLow = 0
         //Array of all items for tableView of roadmap
         var firstDigitTableArray = [FirstDigitItems]()
     
         // Big Small Item
         var tempValues = [String]()
         var labelValuArray : FirstDigitValues?
         var itemArray = [FirstDigitValues]()
         var currentType = ""
         
         // Even odd Item
         var oe_tempValues = [String]()
         var oe_labelValuArray : FirstDigitValues?
         var oe_itemArray = [FirstDigitValues]()
         var oe_currentType = ""
         
         // Even odd Item
         var uml_tempValues = [String]()
         var uml_labelValuArray : FirstDigitValues?
         var uml_itemArray = [FirstDigitValues]()
         var uml_currentType = ""
         
         // Even odd Item
         var numbers_tempValues = [String]()
         var numbers_labelValuArray : FirstDigitValues?
         var numbers_itemArray = [FirstDigitValues]()
         
         for index in 0..<roadmapDataArray.count {
             
             switch type {
             case 1:
                 itemAtIndex = roadmapDataArray[index].no1
                 limForBig = 4
                 limForUp = 4
                 limForLow = 6
             case 2:
                 itemAtIndex = roadmapDataArray[index].no2
                 limForBig = 4
                 limForUp = 4
                 limForLow = 6
             case 3:
                 itemAtIndex = Int(String(roadmapDataArray[index].no1)+String(roadmapDataArray[index].no2))!
                 limForBig = 50
                 limForUp = 34
                 limForLow = 66
             case 4:
                 itemAtIndex = roadmapDataArray[index].no1+roadmapDataArray[index].no2
                 limForBig = 9
                 limForUp = 6
                 limForLow = 11
             default: break
             }
             
             //Algorithm and logic to find BIG – 5, 6, 7, 8, 9 and SMALL – 0, 1, 2, 3, 4 number and create roadmap collection view model
             if itemAtIndex>limForBig {
                 if currentType == "S" && index>0{
                     var tempSixValuesArray = tempValues+["","","","","",""]
                     tempSixValuesArray = tempSixValuesArray.dropLast(tempValues.count)
                     labelValuArray = FirstDigitValues(JSON: ["valueArray" : tempSixValuesArray])
                     itemArray.append(labelValuArray!)
                     tempValues = []
                 }
                 tempValues.append("B")
                 currentType = "B"

             } else {
                 if currentType == "B" && index>0{
                     var tempSixValuesArray = tempValues+["","","","","",""]
                     tempSixValuesArray = tempSixValuesArray.dropLast(tempValues.count)
                     labelValuArray = FirstDigitValues(JSON: ["valueArray" : tempSixValuesArray])
                     itemArray.append(labelValuArray!)
                     tempValues = []
                 }
                 currentType = "S"
                 tempValues.append("S")
             }
             
             //Algorithm and logic to find EVEN – 0, 2, 4, 6, 8 and ODD – 1, 3, 5, 7, 9 number and create roadmap collection view model
             if itemAtIndex%2==0 {
                if oe_currentType == "O" && index>0{
                    var tempSixValuesArray = oe_tempValues+["","","","","",""]
                    tempSixValuesArray = tempSixValuesArray.dropLast(oe_tempValues.count)
                    oe_labelValuArray = FirstDigitValues(JSON: ["valueArray" : tempSixValuesArray])
                    oe_itemArray.append(oe_labelValuArray!)
                    oe_tempValues = []
                }
                oe_tempValues.append("E")
                oe_currentType = "E"

            } else {
                if oe_currentType == "E" && index>0{
                    var tempSixValuesArray = oe_tempValues+["","","","","",""]
                    tempSixValuesArray = tempSixValuesArray.dropLast(oe_tempValues.count)
                    oe_labelValuArray = FirstDigitValues(JSON: ["valueArray" : tempSixValuesArray])
                    oe_itemArray.append(oe_labelValuArray!)
                    oe_tempValues = []
                }
                oe_currentType = "O"
                oe_tempValues.append("O")
             }
                 
             //Algorithm and logic to find UP – 0, 1, 2, 3 | MIDDLE – 4, 5, 6 | LOW – 7, 8, 9 and create roadmap collection view model
            if itemAtIndex<limForUp {
               if (uml_currentType == "M" || uml_currentType == "L") && index>0 {
                   var tempSixValuesArray = uml_tempValues+["","","","","",""]
                   tempSixValuesArray = tempSixValuesArray.dropLast(uml_tempValues.count)
                   uml_labelValuArray = FirstDigitValues(JSON: ["valueArray" : tempSixValuesArray])
                   uml_itemArray.append(uml_labelValuArray!)
                   uml_tempValues = []
               }
               uml_tempValues.append("U")
               uml_currentType = "U"
               
           } else if itemAtIndex>limForLow {
                if (uml_currentType == "M" || uml_currentType == "U") && index>0{
                    var tempSixValuesArray = uml_tempValues+["","","","","",""]
                    tempSixValuesArray = tempSixValuesArray.dropLast(uml_tempValues.count)
                    uml_labelValuArray = FirstDigitValues(JSON: ["valueArray" : tempSixValuesArray])
                    uml_itemArray.append(uml_labelValuArray!)
                    uml_tempValues = []
                }
                uml_currentType = "L"
                uml_tempValues.append("L")
         } else {
                if (uml_currentType == "L" || uml_currentType == "U") && index>0{
                    var tempSixValuesArray = uml_tempValues+["","","","","",""]
                    tempSixValuesArray = tempSixValuesArray.dropLast(uml_tempValues.count)
                    uml_labelValuArray = FirstDigitValues(JSON: ["valueArray" : tempSixValuesArray])
                    uml_itemArray.append(uml_labelValuArray!)
                    uml_tempValues = []
                }
                uml_currentType = "M"
                uml_tempValues.append("M")
         }
              //Algorithm and logic to display all numbers with the limit of n...
             
             if index%6==0 && index>0{
                 numbers_labelValuArray = FirstDigitValues(JSON: ["valueArray" : numbers_tempValues])
                 numbers_itemArray.append(numbers_labelValuArray!)
                 numbers_tempValues = []
             }
             numbers_tempValues.append(String(itemAtIndex))
      }
         
             // Add last element after iteration in Big and small
             var tempSixValuesArray = tempValues+["","","","","",""]
             tempSixValuesArray = tempSixValuesArray.dropLast(tempValues.count)
             labelValuArray = FirstDigitValues(JSON: ["valueArray" : tempSixValuesArray])
             itemArray.append(labelValuArray!)
             tempValues = []
             let firstDigitCollectionObject = FirstDigitItems(JSON: ["itemArray" : itemArray])
             firstDigitCollectionObject?.itemArray = itemArray
             firstDigitTableArray.append(firstDigitCollectionObject!)
             
             // Add last element after iteration in even and odd
             var oe_tempSixValuesArray = oe_tempValues+["","","","","",""]
             oe_tempSixValuesArray = oe_tempSixValuesArray.dropLast(oe_tempValues.count)
             oe_labelValuArray = FirstDigitValues(JSON: ["valueArray" : oe_tempSixValuesArray])
             oe_itemArray.append(oe_labelValuArray!)
             oe_tempValues = []
             let oe_firstDigitCollectionObject = FirstDigitItems(JSON: ["itemArray" : oe_itemArray])
             oe_firstDigitCollectionObject?.itemArray = oe_itemArray
             firstDigitTableArray.append(oe_firstDigitCollectionObject!)
     
             // Add last element after iteration in low, up, mid
             var uml_tempSixValuesArray = uml_tempValues+["","","","","",""]
             uml_tempSixValuesArray = uml_tempSixValuesArray.dropLast(uml_tempValues.count)
             uml_labelValuArray = FirstDigitValues(JSON: ["valueArray" : uml_tempSixValuesArray])
             uml_itemArray.append(uml_labelValuArray!)
             uml_tempValues = []
             let uml_firstDigitCollectionObject = FirstDigitItems(JSON: ["itemArray" : uml_itemArray])
             uml_firstDigitCollectionObject?.itemArray = uml_itemArray
             firstDigitTableArray.append(uml_firstDigitCollectionObject!)
         
             // Add last element after iteration in all numbers
             var numbers_tempSixValuesArray = numbers_tempValues+["","","","","",""]
             numbers_tempSixValuesArray = numbers_tempSixValuesArray.dropLast(numbers_tempValues.count)
             numbers_labelValuArray = FirstDigitValues(JSON: ["valueArray" : numbers_tempSixValuesArray])
             numbers_itemArray.append(numbers_labelValuArray!)
             numbers_tempValues = []
             let numbers_firstDigitCollectionObject = FirstDigitItems(JSON: ["itemArray" : numbers_itemArray])
             numbers_firstDigitCollectionObject?.itemArray = numbers_itemArray
             firstDigitTableArray.append(numbers_firstDigitCollectionObject!)
             
         return firstDigitTableArray
     }
}
