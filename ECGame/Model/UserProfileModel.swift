//
//  UserProfileModel.swift
//  ECGame
//
//  Created by hfcb on 20/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit
import ObjectMapper

class UserProfileModel: Mappable {
       var code = 0
       var data : [UserProfileData]?
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
       
   class UserProfileData: Mappable {
       
     var id = 0
     var userId = 0
     var name = ""
     var userApiId = ""
     var userBalance = 0
     var email = ""
     var userIp = ""
     var password = ""
     var api_token = ""
     var lastLoginAt = ""
     var lastIpLoginAt = ""
     var lastActivity = ""
     var remember_token = ""
     var created_at = ""
     var updated_at = ""
     var userStatus = false
     var webId = 0
     var isBanned = false
     var avatar = ""
     var device  = ""
     var country = ""
     var gender = 0
     var rollingAmount = 0

       
       required init?(map: Map) {
           //
       }
       
       func mapping(map: Map) {
           id <- map["id"]
           userId <- map["userId"]
          name <- map["name"]
          userApiId <- map["userApiId"]
          userBalance <- map["userBalance"]
          email <- map["email"]
          userIp <- map["userIp"]
          password <- map["password"]
          api_token <- map["api_token"]
          lastLoginAt <- map["lastLoginAt"]
          lastIpLoginAt <- map["lastIpLoginAt"]
          lastActivity <- map["lastActivity"]
          remember_token <- map["remember_token"]
          created_at <- map["created_at"]
          updated_at <- map["updated_at"]
          userStatus <- map["userStatus"]
          webId <- map["webId"]
          isBanned <- map["isBanned"]
          avatar <- map["avatar"]
          device <- map["device "]
          country <- map["country"]
          gender <- map["gender"]
          rollingAmount <- map["rollingAmount"]
       }
   }
