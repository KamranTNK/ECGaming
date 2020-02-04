//
//  StockAnalysisModel.swift
//  ECGame
//
//  Created by hfcb on 21/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit
import ObjectMapper

class StockAnalysisModel: Mappable {
  
    var code = 0
    var data : [StockAnalysisDataModel]?
    var status = false
    var message = ""
    
    required init?(map: Map) {
        //
    }
    
    func mapping(map: Map) {
        code<-map["code"]
        data<-map["data"]
        status<-map["status"]
        message<-map["message"]
    }
}

class StockAnalysisDataModel: Mappable {
  
    var winBet = 0
    var loseBet = 0
    var totalBet = 0
    var stockName = ""
    var winRate = 0.0
    
    required init?(map: Map) {
        //
    }
    
    func mapping(map: Map) {
        winBet<-map["winBet"]
        loseBet<-map["loseBet"]
        totalBet<-map["totalBet"]
        stockName<-map["stockName"]
        winRate<-map["winRate"]
    }
}
