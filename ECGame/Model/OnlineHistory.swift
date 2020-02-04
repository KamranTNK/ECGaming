//
//  OnlineHistory.swift
//  ECGame
//
//  Created by hfcb on 21/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit
import ObjectMapper

//MARK: -  Bet History List
class OnlineHistoryModel: Mappable {
    
    var code = 0
    var data : [OnlineHistoryModelDataModel]?
    var status = false
    var message = ""
    
    required init?(map: Map) {
        //
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
   }
}
class OnlineHistoryModelDataModel: Mappable {
    
    var timeOnline = ""
    var da_te = ""
    
    required init?(map: Map) {
        //
    }
    
    func mapping(map: Map) {
        timeOnline <- map["timeOnline"]
        da_te <- map["da_te"]
    }
}
