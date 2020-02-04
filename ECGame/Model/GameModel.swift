//
//  GameModel.swift
//  ECGame
//
//  Created by hfcb on 14/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit
import ObjectMapper

class RoadmapModel: Mappable {
    
    var code = 0
    var data : [RoadmapDataModel]?
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
    
class RoadmapDataModel: Mappable {
    
    var totalWinning = 0
    var totalUsers = 0
    var result = 0
    var roadMap : [RoadmapDataObjectModel]?
    
    required init?(map: Map) {
        //
    }
    
    func mapping(map: Map) {
        totalWinning <- map["totalWinning"]
        totalUsers <- map["totalUsers"]
        result <- map["result"]
        roadMap <- map["roadMap"]
    }
}

class RoadmapDataObjectModel: Mappable {

    var id = 0
    var DRdate = ""
    var no1 = 0
    var no2  = 0
    var gameId = ""
    var writetime = ""
    var flag = ""
    var PT = ""
    
    required init?(map: Map) {
        //
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        DRdate <- map["DRdate"]
        no1 <- map["no1"]
        no2 <- map["no2"]
        gameId <- map["gameId"]
        flag <- map["flag"]
        PT <- map["PT"]
    }
}

//MARK: - Current Bet List
class CurrentBetListModel: Mappable {
    
    var code = 0
    var data : [CurrentBetListDataModel]?
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
class CurrentBetListDataModel: Mappable {
    
    var currentId = ""
    var currentbetAmount = 0
    var currentpayoutAmount = 0.00
    var currentRule = ""
    var currentStockName = ""
    var currentLoops = ""
    
    required init?(map: Map) {
        //
    }
    
    func mapping(map: Map) {
        currentId <- map["betId"]
        currentbetAmount <- map["betAmount"]
        currentpayoutAmount <- map["payoutAmount"]
        currentRule <- map["rule"]
        currentStockName <- map["stockName"]
        currentLoops <- map["loops"]
    
    }
}

//MARK: -  Bet History List -
class BetHistoryListModel: Mappable {
    
    var code = 0
    var data : [BetHistoryListDataModel]?
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
class BetHistoryListDataModel: Mappable {
    
    var betHistorytId = ""
    var betHistoryAmount = 0.00
    var betHistorypayoutAmount = 0.00
    var betHistoryTime = " "
    var betHistoryRule = " "
    var betHistoryName = " "
    var betHistoryLoops = " "
    
   
    required init?(map: Map) {
        //
    }
    
    func mapping(map: Map) {
        betHistorytId <- map["betId"]
        betHistoryAmount <- map["rollingAmount"]
        betHistorypayoutAmount <- map["payoutAmount"]
        betHistoryTime <- map["betTime"]
        betHistoryRule <- map["rule"]
        betHistoryName <- map["stockName"]
        betHistoryLoops <- map["loops"]
    
    }
}



//MARK: - Stock List -
class StockListModel: Mappable {
    
    var code = 0
    var data : [StockListDataModel]?
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

class StockListDataModel: Mappable {
    
    var stockName = ""
    var stockReference = ""
    var stockcurrentPrice = 0.00
   
    required init?(map: Map) {
        //
    }
    
    func mapping(map: Map) {
        stockName <- map["name"]
        stockReference <- map["referName"]
        stockcurrentPrice <- map["currentPrice"]
       
    }
}

//MARK: - Announcement List -
class AnnouncementListModel: Mappable {
    
    var code = 0
    var data : [AnnouncementListDataModel]?
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

class AnnouncementListDataModel: Mappable {
    
    var announcementId = 0
    var announcementTitle = ""
    var announcementMessageContent = ""
    var announcementCreated_at = ""
    
   
    required init?(map: Map) {
        //
    }
    
    func mapping(map: Map) {
        announcementId <- map["id"]
        announcementTitle <- map["title"]
        announcementMessageContent <- map["messageContent"]
        announcementCreated_at <- map["created_at"]
        
    }
}

//MARK: - Timer Model -
class StockTimerModel: Mappable {
    
    var code = 0
    var data : [StockTimerDataModel]?
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

class StockTimerDataModel: Mappable {
    
    var stockId = 0
    var name = ""
    var timer = 0
    var loop  = 0
    var closeTime = 0
    required init?(map: Map) {
        //
    }
    
    func mapping(map: Map) {
        stockId <- map["stockId"]
        name <- map["name"]
        timer <- map["timer"]
        loop <- map["loop"]
        closeTime <- map["closeTime"]
    }
}

//MARK: - Store Bet -
class StoreBetModel: Mappable {
    
    var code = 0
    var data : [StoreBetDataModel]?
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

class StoreBetDataModel: Mappable {
    
    var userApiId = ""
    var betTime = ""
    var betId  = ""
    var betAmount = 0
    var payoutAmount = 0
    var rollingAmount = 0
    var gameId  = ""
    var betStatus = ""
    var result  = ""
    var userId = ""
    var rule  = ""
    var stock = ""
    var loops = ""
    
    required init?(map: Map) {
        //
    }
    
    func mapping(map: Map) {
        userApiId <- map["userApiId"]
        betTime <- map["betTime"]
        betId <- map["betId"]
        betAmount <- map["betAmount"]
        payoutAmount <- map["payoutAmount"]
        rollingAmount <- map["rollingAmount"]
        gameId <- map["gameId"]
        betStatus <- map["betStatus"]
        result <- map["result"]
        userId <- map["userId"]
        rule <- map["rule"]
        stock <- map["stock"]
        loops <- map["loops"]
    }
}
//MARK: - Notification Model -
class NotificationModel: Mappable {
    
    var code = 0
    var data : [NotificationDataModel]?
    var status = false
    var message = ""
    var userBalance = 0
    
    required init?(map: Map) {
        //
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        status <- map["status"]
        message <- map["message"]
        userBalance <- map["userBalance"]
        data <- map["data"]
   }
}

class NotificationDataModel: Mappable {
    
    var message = ""
    required init?(map: Map) {
        //
    }
    func mapping(map: Map) {
        message <- map["message"]
    }
}

class FirstDigitValues: Mappable {
        var valueArray = [String]()
           
         required init?(map: Map) {}
    
         func mapping(map: Map) {
           valueArray <- map["valueArray"]
    }
}

class FirstDigitItems: Mappable {
       
    var itemArray : [FirstDigitValues]?
 
            required init?(map: Map) {
            }
    
            func mapping(map: Map) {
               itemArray <- map["itemArray"]
    }
}
