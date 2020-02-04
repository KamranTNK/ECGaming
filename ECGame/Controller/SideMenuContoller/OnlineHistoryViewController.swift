//
//  OnlineHistoryViewController.swift
//  ECGame
//
//  Created by hfcb on 1/16/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit
import Charts
import ObjectMapper

private class CubicLineSampleFillFormatter: IFillFormatter {
    func getFillLinePosition(dataSet: ILineChartDataSet, dataProvider: LineChartDataProvider) -> CGFloat {
        return -10
    }
}

class OnlineHistoryViewController: UIViewController, ChartViewDelegate, datePickerOpen {

    //MARK:- IBOutlet
    @IBOutlet var chartView: LineChartView!
    @IBOutlet weak var fromDateView: UIView!
    @IBOutlet weak var fromDateBtnOutlet: UIButton!
    @IBOutlet weak var toDateView: UIView!
    @IBOutlet weak var toDateBtnOutlet: UIButton!
    @IBOutlet weak var sortByView: UIView!
    @IBOutlet weak var sortByBtnOutlet: UIButton!
    @IBOutlet weak var goBtnOutlet: UIButton!
    @IBOutlet weak var mainBackView: UIView!
    @IBOutlet weak var navTitle: UILabel!
    @IBOutlet weak var playerIdLabel: UILabel!
    @IBOutlet weak var showPlayerIdLabel: UILabel!
    @IBOutlet weak var onlineTimeLabel: UILabel!
    @IBOutlet weak var showOnlineTimeLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var showTotalTimeLabel: UILabel!
    
    
    //MARK:- Let/Var
    var datePickerView = DatePickerView()
    var btnTag:Int = 0
    
    //MARK:- Variables -
    var onlineHistoryModel : OnlineHistoryModel?
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadBasicView()
    }
    
    //MARK: - Laod Intials - 
    func loadBasicView() {
        self.navTitle.text = StockListScreen.onlineHistoryString.localiz().uppercased()
        self.fromDateBtnOutlet.setTitle(betHistory.fromDateString.localiz(), for: .normal)
        self.toDateBtnOutlet.setTitle(betHistory.toDateString.localiz(), for: .normal)
        self.goBtnOutlet.setTitle(betHistory.goString.localiz(), for: .normal)
        self.sortByBtnOutlet.setTitle(betHistory.sortByString, for: .normal)
        self.playerIdLabel.text = "\(betHistory.playerIdString.localiz()) \(":")"
        self.onlineTimeLabel.text = "\(betHistory.onlineTimeString.localiz()) \(":")"
        self.totalTimeLabel.text = "\(betHistory.totalOnlineTimeString.localiz()) \(":")"
        fromDateView.setCornerRadiusOfView(cornerRadiusValue: 5)
        toDateView.setCornerRadiusOfView(cornerRadiusValue: 5)
        sortByView.setCornerRadiusOfView(cornerRadiusValue: 5)
        goBtnOutlet.setCornerRadiusOfButton(cornerRadiusValue: 10)
        self.createChartView()
        self.getOnlineHistoryAPI(userID: Identifier.username, method: APIField.methodType, fromDate: "", toDate: "")
    }
    
   //MARK:- IBAction: -
    @IBAction func OnClickBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func OnClickFromDateButtton(_ sender: UIButton) {
        btnTag = 1
        self.getDatePickerBtnAction(minDate: "")
    }
    @IBAction func OnClickToDateButton(_ sender: UIButton) {
        guard let fromtext = self.fromDateBtnOutlet.titleLabel?.text, fromtext != PickerTitle.fromDateStrConstant else {
           self.makeToastInCenterWithMessage(AlertField.selectFromDateString)
           return
        }
        btnTag = 2
        self.getDatePickerBtnAction(minDate: fromtext)
    }
    @IBAction func OnClickSortByButton(_ sender: UIButton) {
   
    }
    @IBAction func OnClickGoButton(_ sender: UIButton) {
        
        guard let fromtext = self.fromDateBtnOutlet.titleLabel?.text, fromtext != PickerTitle.fromDateStrConstant else {
            self.makeToastInCenterWithMessage(AlertField.selectFromDateString)
           return
        }
        guard let toText = self.toDateBtnOutlet.titleLabel?.text, toText != PickerTitle.toDateStrConstant else {
           self.makeToastInCenterWithMessage(AlertField.selectToDateString)
           return
        }
        self.getOnlineHistoryAPI(userID: Identifier.username, method: APIField.methodType, fromDate: self.fromDateBtnOutlet.titleLabel?.text ?? "", toDate: self.toDateBtnOutlet.titleLabel?.text ?? "")
    }
    
    //MARK:- IBAction Method
    func getDatePickerBtnAction(minDate : String){
        self.mainBackView.alpha = 0.5
        self.mainBackView.isUserInteractionEnabled = false
        datePickerView = Bundle.main.loadNibNamed(DatePickerView.className(), owner: self, options: nil)?[0] as! DatePickerView
        datePickerView.delegate = self
        datePickerView.dateFormatter.dateFormat = PickerTitle.datePickerFormatString
        if minDate.count == 0 {
           datePickerView.pickerView.maximumDate = Date()
        }else {
           let date = datePickerView.dateFormatter.date(from: minDate)
           datePickerView.pickerView.minimumDate = date
           datePickerView.pickerView.maximumDate = Date()
        }
        datePickerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        datePickerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.addSubview(datePickerView)
        datePickerView.popIn()
    }
    
    //MARK:- Picker custom Delegate
    func opendatePickerAction(selectedDate: String) {
        self.mainBackView.alpha = 1
        self.mainBackView.isUserInteractionEnabled = true
        if selectedDate.count>0 {
            if btnTag == 1 {
                self.fromDateBtnOutlet.setTitle(selectedDate, for: .normal)
            }else {
                self.toDateBtnOutlet.setTitle(selectedDate, for: .normal)
            }
        }
    }
  
    //MARK: - Create Charts -
    func createChartView() -> Void {
        chartView.delegate = self
        chartView.layer.borderWidth = 1.0
        chartView.layer.borderColor = UIColor.white.cgColor
        chartView.setViewPortOffsets(left: 0, top: 20, right: 0, bottom: 0)
        chartView.backgroundColor = UIColor.white
        chartView.dragEnabled = false
        chartView.setScaleEnabled(false)
        chartView.pinchZoomEnabled = false
        chartView.maxHighlightDistance = 300
        let yAxis = chartView.leftAxis
        yAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size:12)!
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .black
        yAxis.labelPosition = .insideChart
        yAxis.axisLineColor = .black
        chartView.rightAxis.enabled = false
        chartView.legend.enabled = false
        chartView.animate(xAxisDuration: 2, yAxisDuration: 2)
        chartView.xAxis.drawAxisLineEnabled = true
        chartView.xAxis.enabled = true
        chartView.xAxis.drawLimitLinesBehindDataEnabled = false
        chartView.xAxis.gridColor = UIColor(red:220/255, green:220/255,blue:220/255,alpha:1)
        chartView.xAxis.gridLineWidth = 0.5
        chartView.xAxis.drawGridLinesEnabled = true
        chartView.xAxis.drawLabelsEnabled = true
        chartView.xAxis.labelPosition = .bottom
        
        //let marker = PillMarker(color: .white, font: UIFont.boldSystemFont(ofSize: 14), textColor: .black)
        //chartView.marker = marker
        updateChartData()
    }
    
    func updateChartData() {
        chartView.data = nil
        let dataCounter = self.onlineHistoryModel?.data?.count ?? 0
        self.setDataCount(dataCounter, range: UInt32(1000))
        return
    }
    
    func setDataCount(_ count: Int, range: UInt32) {
        let yVals1 = (0..<count).map { (i) -> ChartDataEntry in
            let val = self.onlineHistoryModel?.data![i].timeOnline
            return ChartDataEntry(x: Double(i), y: Double(val!)!)
        }
        let set1 = LineChartDataSet(entries: yVals1, label: "DataSet")
        set1.mode = .horizontalBezier
        set1.drawCircleHoleEnabled = true
        set1.fillColor = UIColor(red:99/255, green:94/255,blue:154/255,alpha:1)
        let color = UIColor(red:222/255, green:139/255,blue:139/255,alpha:1)
        set1.colors = [color]
        set1.drawCirclesEnabled = false
        set1.drawFilledEnabled = true
        set1.lineWidth = 1.0
        set1.fillAlpha = 1.0
        set1.cubicIntensity  = 1
        let data = LineChartData(dataSet: set1)
        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 9)!)
        data.setDrawValues(false)
        chartView.data = data
        chartView.animate(xAxisDuration: 0.5, easingOption: .easeInCubic)
        chartView.animate(yAxisDuration: 0.5, easingOption: .easeInCubic)
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false
    }
    
}

// MARK: API Call
extension OnlineHistoryViewController {
    // Getting Stock
    func getOnlineHistoryAPI(userID : String, method : String ,fromDate : String, toDate : String) {
        if NetworkManager.sharedInstance.isInternetAvailable(){
            self.showHUD(progressLabel: AlertField.loaderString)
            let stateURL : String = UrlName.baseUrl + UrlName.onlineHistoryUrl + userID + PickerTitle.separatorString + APIField.method + method + PickerTitle.separatorString + PickerTitle.fromDateString + fromDate + PickerTitle.separatorString  + PickerTitle.toDateString + toDate
            NetworkManager.sharedInstance.commonNetworkCallWithHeader(header: [:], url: stateURL, method: .get, parameters: nil, completionHandler: { (json, status) in
                guard let jsonValue = json else {
                    self.dismissHUD(isAnimated: true)
                    return
                }
                self.onlineHistoryModel = Mapper<OnlineHistoryModel>().map(JSONObject: jsonValue)
                if  self.onlineHistoryModel?.code == 200, self.onlineHistoryModel!.status {
                    if let list = self.onlineHistoryModel?.data, !list.isEmpty {
                        self.updateChartData()
                    }
                }
                self.dismissHUD(isAnimated: true)
            })
        }else{
            self.showNoInternetAlert()
        }
    } 
}
