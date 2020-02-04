//
//  Constants.swift
//  Dummy
//
//  Created by Dummy on 15/05/19.
//  Copyright © 2019 Dummy. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Identifier
struct Identifier {
    static let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    static let sideMenuStoryBoard = UIStoryboard(name: "SideMenu", bundle: nil)
    static let appId = "172"
    static let username = "3_0001_0008_00055_00"
}

// MARK:- Screen Sizes
struct ScreenSize {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
}

// MARK:- Colour
struct Color {
    static let primaryColor = "#700000"
    static let labelColor = "#E3942E"
    static let btnSkyColor = "#03cdff"
    static let btnGreenColor = "#13c196"
    static let btnYellowColor = "#e8a31f"
    static let btnBlueColor = "#038fe0"
    static let btnVoiletColor = "#9600ff"
    static let tooltipColor1 = "#DC7B66"
    static let tooltipColor2 = "#F1AC9D"
    static let dropdownTextColor = "#000000"
    static let roadmapRedColor = "#B8413F"
    static let roadmapGreenColor = "#35DC71"
    static let settingSectionColor = "#373737"
}

//MARK: - URL
struct UrlName {
    static let API_Token = "?apikey=DSovQRXWgUE0mgXTo8eY15nWZ3PFLhWsTsTehm3zxzXCR2XwrSsJ9ZElAWErI73Y85T2kCJMQNGbrfyJ"
    static let timerUrl = "https://stock-price-mobile.herokuapp.com/"
    static let baseUrl = "http://159.138.45.25/"
    static let stockLivePriceUrl = "liveprice"
    static let stockListUrl = "apimobile/stockList"
    static let storeBetUrl = "apimobile/storebet"
    static let viewUserProfile = "apimobile/userDetails"
    static let announcementUrl = "apimobile/announcement"
    static let userRunningBetUrl = "apimobile/userRunningBet?userId="
    static let betHistoryUrl = "apimobile/userBetHistory"
    static let onlineHistoryUrl = "apimobile/onlineHistory?userId="
    static let roadMapUrl = "apimobile/getCrawlInfo?stockId="
    static let notificationUrl = "apimobile/latestBet"
    static let updateUserProfileUrl = "apimobile/editProfile"
    static let stockAnalysisUrl = "apimobile/betAnalysis"
}
//MARK: - Picker Title -
struct PickerTitle {
    static let limitString = "limit="
    static let postlimitString = "limit"
    static let separatorString = "&"
    static let fromDateString = "dateForm="
    static let postFromDate = "dateForm"
    static let toDateString = "dateTo="
    static let postToDate = "dateTo"
    static let fromDateStrConstant = "From Date"
    static let toDateStrConstant = "To Date"
    static let datePickerFormatString = "yyyy-MM-dd"
    static let userId = "userId"
}

// MARK: - Navigation Bar Title
struct NavigationTitle {
    static let gamingString = "gaming"
    static let gameIntroString = "Select the road map for directly onboarding"
    static let appNameString = "EC Game"
    static let registrationString = "Registration"
    static let aboutUsString = "About Us"
    static let termsString = "Terms and Condition"
    static let helpString = "Help"
    static let privacyPolicyString = "Privacy Policy"
    static let notificationString = "Notifications"
    
}

//MARK:- UIImage name
struct ImageName {
    static let radioIcon = "radio"
    static let listenSetIcon = "listenSet"
    static let practiceSetIcon = "practiceSet"
    static let speakSetIcon = "speakSet"
    static let playIcon = "play"
    static let pauseIcon = "pause"
    static let playselectIcon = "playselect"
    static let playunselectIcon = "playunselect"
    static let rightIcon = "right"
    static let wrongIcon = "wrong"
    static let starIcon = "star"
    static let dummyUrl = "http://userdetails.rsgr.in/assets/ApptiveLearnData/Standard1/AHW1.jpg"
}

//MARK: - Response Key Name
struct JsonKey {
    static let itemNameKey = "itemName"
    static let videoLinkKey = "videoLink"
    static let audioLinkKey = "audioLink"
    static let questionArrayKey = "questionArray"
    static let imageLinksArrayKey = "imageLinksArray"
    static let speakTextKey = "speakText"
    static let proTextKey = "proText"
    static let themeNameKey = "themeName"
    static let themesArrayKey = "themesArray"
}

//MARK: - Asset Name
struct AssetName {
    static let mp3String = "mp3"
    static let mp4String = "mp4"
    static let jsonString = "json"
    static let htmlString = "html"
    static let fontName = "FreeSerif"
    static let usaFlag = "USA Flag.png"
    static let chinaFlag = "China Flag.png"
    static let laoFlag = "Laos Flag.png"
    static let thaiFlag = "Thailand Flag.png"
    static let chipsString = "Chips"
    static let chipsSelectedString = "Chips-Selected"
}

// MARK:- Web Service Params
struct APIField {
    static let getMethod = "GET"
    static let postMethod = "POST"
    static let dataKey = "data"
    static let errorKey = "error"
    static let resCode = "status"
    static let resStatus = "status"
    static let respMsg = "message"
    static let method = "method="
    static let methodType = "chart"
}

// MARK:- Asset Resource
struct AssetResource {
    static let welcomeSound = "bensound"
    static let mosueClickSound = "mouseClick"
}

// MARK:- Stock Params
struct Stock {
    static let ChinaStock = "China Stock"
    static let USStock = "US Stock"
    static let CryptoCurrency = "Crypto Currency"
    static let SH000001 = "SH000001"
    static let SZ399001 = "SZ399001"
    static let SZ399415 = "SZ399415"
    static let SH000300 = "SH000300"
    static let USDollarIndiex = "US Dollar Index"
    static let BTCUSDT = "BTC/USDT"
    static let oneMinutes = "1 Minute Loop"
    static let fiveMinutes = "5 Minute Loop"
    static let selectBTU = "Select BTU"
    static let selectTime = "Select Time"
    
}

//MARK: - Button Title
struct buttonTitle {
    static let numberFirstDigitString = "0-9\nFirst Digit"
    static let numberLastDigitString = "0-9\nLast Digit"
    static let numberTwoDigitString = "0-99\nTwo Digit"
    static let numberBothDigitString = "0-18\nBoth Digit"  //Sum
    static let firstDigitString = "First\nDigit"
    static let lastDigitString = "Last\nDigit"
    static let twoDigitString = "Two\nDigit"
    static let bothDigitString = "Both\nDigit"
    static let numberDigitString = "Numbers"
    static let claerBtnString = "Clear"
    static let confirmBtnString = "Confirm"
    static let bigBtnString = "BIG"
    static let smallBtnString = "SML"
    static let oddBtnString = "ODD"
    static let evenBtnString = "EVEN"
    static let highBtnString = "HIGH"
    static let lowBtnString = "LOW"
    static let midBtnString = "MID"
    static let roadmapfirstDigitString = "First Digit"
    static let roadmaplastDigitString = "Last Digit"
    static let roadmaptwoDigitString = "Two Digit"
    static let roadmapbothDigitString = "Both Digit"
    static let rmLastDrawTitleString = "LAST DRAW:"
    static let rmTotalWiningTitletString = "TOTAL WINNINGS:"
    static let rmNoOfuserTitleString = "NO OF USERS:"
    static let rmResultsTitleString = "RESULTS:"
}

// MARK: - User Defaults
struct UserDefaultsKey {
    static let isAlreadyLoginString = "isAlreadyLogin"
    static let regIdKeyString = "regIdKey"
    static let deviceTokenString = "deviceTokenKey"
    static let switchAcctString = "switchAcctKey"
    static let isLanguageDefinded = "customLanguage"
    static let isMusicOnOff = "musicOnOff"
    static let isProfileShow = "ProfileShow"
    

}

// MARK: - AlertField Names
struct AlertField {
    static let appTitle = "EC Game"
    static let oopsString = "OOPS!!!"
    static let okString = "Ok"
    static let cancelString = "Cancel"
    static let warningString = "Warning!"
    static let loaderString = "Loading"
    static let saveString = "Saved!"
    static let errorString = "Error"
    static let noString = "NO"
    static let yesString = "YES"
    static let alertString = "Alert!"
    static let selectDateString = "Select Date"
    static let emptyNameString = "Please enter your name"
    static let validUserNameString = "Please enter valid name."
    static let emptyGenderString = "Please select gender"
    static let emptyCountryString = "Please select country name"
    static let emptyEmailString = "Please enter email address"
    static let emptyRollingString = "Please select user rolling"
    static let emailNotValidString = "Please enter valid email address"
    static let noInternetString = "Seems like your internet services are disabled, please go to Settings and turn on Internet Services."
    static let betClosedString = "Bet Closed"
    static let betDoneString = "Bet Successful"
    static let emptyStockString = "Please select stock"
    static let emptyDigitTypeString = "Please select digit type"
    static let emptyChipValueString = "Please select chips"
    static let emptyTimeLoopString = "Please select time loop related to stock"
    static let selectFromDateString = "Please select \'From Date\'"
    static let selectToDateString = "Please select \'To Date\'"
}

//MARK:- Gender
struct Gender {
    static let Male = "Male"
    static let Female = "Female"
}

//MARK:- Profile
struct ProfileScreen {
    static let genderString = "Gender"
    static let nameString = "Name"
    static let emailString = "Email"
    static let countryString = "Country"
    static let rollingString = "Rolling"
    static let profileString = "Profile"
    static let saveString = "Save"
    static let cancleString = "Cancel"
}

//MARK:- Current Bet
struct CurrentBetScreen {
    static let currentBetString = "Current Bet"
    static let betIdString = "Bet Id"
    static let betDetailsString = "Bet Detail"
    static let amountString = "Amount"
    static let payoutString = "Payout"
    static let betStatusString = "Bet Status"
    static let totalString = "Total"
    static let pendingString = "Pending"
}

//MARK:- Bet History
struct BetHistoryScreen {
    static let betHistoryString = "Bet History"
    static let goString = "Go"
    static let betHistoryTimeString = "Time"
}

//MARK:- Stock List
struct StockListScreen {
    static let stockListString = "Stock List"
    static let stockNameString = "Stock Name"
    static let livePriceString = "Live Price"
    static let referenceString = "Reference"
    static let titleString = "Title"
    static let previewString = "Preview"
    static let dateString = "Date"
    static let announcementString = "Announcements"
    static let ruleString = "Rules"
    static let stockAnalysisString = "STOCK ANALYSIS"
    static let onlineHistoryString = "ONLINE HISTORY"
}

//MARK: - Bet Digit -
struct BetDigit {
    static let firstdigit = "firstdigit"
    static let lastdigit = "lastdigit"
    static let twodigit = "twodigit"
    static let bothdigit = "bothdigit"
    static let numbers = "numbers"
    static let big = "big"
    static let small = "small"
    static let high = "high"
    static let low = "low"
    static let mid = "mid"
    static let odd = "odd"
    static let even = "even"
    static let firstDigitTag = 20
    static let lastDigitTag = 21
    static let twoDigitTag = 22
    static let bothDigitTag = 23
    static let languageViewTag = 24
    static let betCloseViewTag = 25
}
//MARK: - Payout -
struct Payout {
    static let bigSmall = "Payout: 1.95"
    static let oddEven = "Payout: 2.95"
    static let numberFistLast = "Payout: 9.82"
    static let numberTwo = "Payout: 98.82"
    static let numberBoth = "Payout: 19.92"
}

// MARK:- Stock Params
struct SortBy {
    static let day = "Day"
    static let weeks = "Weeks"
    static let months = "Months"
    static let years = "Years"
}

//MARK:- Data Response
struct DataResponse {
    static let noRecordFound = "No Record Found"
}

//MARK:- Settings Section
struct SettingSection {
    static let setting = "Settings"
    static let account = "Account"
    static let gameOptions = "Game Options"
}

//MARK:- Settings Row
struct SettingRow {
    static let tutorial = "Tutorial"
    static let privacyPolicy = "Privacy Policy"
    static let termsCondition = "Terms & Condition"
    static let language = "Language"
    static let chips = "Chips"
    static let showPrimeMembership = "Show Prime Membership"
    static let sound = "Sound"
    static let allowtoFellowme = "Allow to Follow me"
    static let showmyOnlinestatus = "Show my Online status to my Followers"
    static let notificationsOnline = "Notifications when Friends come Online"
    static let logout = "Logout"
    static let everyOne = "Everyone"
    static let noOne = "No One"
    static let change = "Change"
    static let view = "View"
}

//MARK:- BET HISTORY
struct betHistory {
    //Title
    static let titleString = "Bet History"
    //DateView Title
    static let fromDateString = "From Date"
    static let toDateString = "To Date"
    static let goString = "GO"
    //Header Title
    static let betIdString = "Bet Id"
    static let betDetailString = "Bet Detail"
    static let bettimeString = "Time"
    static let betamountString = "Amount"
    static let betpayoutString = "Payout"
    //Footer Title
    static let totalString = "Total"
    static let sortByString = "Sort By"
    //Online History
    static let playerIdString = "Player Id"
    static let onlineTimeString = "Online Time"
    static let totalOnlineTimeString = "Total Online"
    
}

//MARK :- CHIPS
struct chips {
    static let dangerChipString = "100"
    static let primaryChipString = "500"
    static let successChipString = "1000"
    static let warningChipString = "5000"
    static let blackChipString = "10000"
}

//Class ends here

/*
Chinese - zhHans
English - en
Lao - lao
Thai - th
*/
