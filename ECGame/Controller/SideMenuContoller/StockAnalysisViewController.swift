//
//  StockAnalysisViewController.swift
//  ECGame
//
//  Created by hfcb on 1/13/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit
import Charts
import ObjectMapper


class StockAnalysisViewController: DemoBaseViewController, datePickerOpen  {
    
    //MARK:- IBOutlet
    @IBOutlet weak var fromDateView: UIView!
    @IBOutlet weak var fromDateBtnOutlet: UIButton!
    @IBOutlet weak var toDateBtnOutlet: UIButton!
    @IBOutlet weak var toDateView: UIView!
    @IBOutlet weak var sortByView: UIView!
    @IBOutlet weak var sortByBtnOutlet: UIButton!
    @IBOutlet weak var goBtnOutlet: UIButton!
    @IBOutlet weak var chartView: BarChartView!
    @IBOutlet var sliderX: UISlider!
    @IBOutlet var sliderY: UISlider!
    @IBOutlet var sliderTextX: UITextField!
    @IBOutlet var sliderTextY: UITextField!
    @IBOutlet weak var mainBackView: UIView!
    @IBOutlet weak var navTitle: UILabel!
    
    //MARK:- Let/Var
    var datePickerView = DatePickerView()
    var btnTag:Int = 0
    //MARK:- Let/Var
    var stockAnalysis : StockAnalysisModel?
    lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        formatter.negativeSuffix = ""
        formatter.positiveSuffix = ""
        return formatter
    }()
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        chartView.delegate = self
        chartView.chartDescription?.enabled = false
        chartView.drawBarShadowEnabled = false
        chartView.drawValueAboveBarEnabled = false
        chartView.highlightFullBarEnabled = false
        let leftAxis = chartView.leftAxis
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: formatter)
        leftAxis.axisMinimum = 0
        chartView.rightAxis.enabled = false
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .top
        let l = chartView.legend
        l.horizontalAlignment = .right
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        l.form = .square
        l.formToTextSpace = 4
        l.xEntrySpace = 6
        LoadAllViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        getStockAnalysisAPI(userID: Identifier.username, fromDate: "", toDate: "")
    }
    
    override func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        let upperCaseStockName = stockAnalysis!.data![Int(entry.x)-1].stockName.uppercased()
        self.showAlertWith(title: "Stock Name - ".localiz() + upperCaseStockName, message: "Total Bet(s) - ".localiz() + String(stockAnalysis!.data![Int(entry.x)-1].totalBet) + "\n" + "Win - ".localiz() + String(stockAnalysis!.data![Int(entry.x)-1].winBet) + "\n" + "Lose - ".localiz() + String(stockAnalysis!.data![Int(entry.x)-1].loseBet))
    }
    
    override func updateChartData() {
        if self.shouldHideData {
            chartView.data = nil
            return
        }
        let range = self.stockAnalysis?.data?.max(by: {$0.totalBet<$1.totalBet})
        guard let maxBet = range?.totalBet else {
            return
        }
        //chartView.maxVisibleCount = maxBet+10
        let xAxis = chartView.xAxis
        xAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size:12)!
        xAxis.setLabelCount((stockAnalysis?.data!.count)!, force: false)
        self.setChartData(count: (stockAnalysis?.data!.count)!, range: UInt32(maxBet))
    }
    
    func setChartData(count: Int, range: UInt32) {
        let yVals = (0..<count).map { (i) -> BarChartDataEntry in
            print(i)
            let val1 = Double((stockAnalysis?.data![i].winBet)!)
            let val2 = Double((stockAnalysis?.data![i].loseBet)!)
            return BarChartDataEntry(x: Double(i+1), yValues: [val1, val2], icon: #imageLiteral(resourceName: "primary"))
        }
        
        let set = BarChartDataSet(entries: yVals, label: "")
        set.drawIconsEnabled = false
        set.colors = [UIColor.blue, UIColor.red]
        set.stackLabels = ["Win".localiz(), "Lose".localiz()]
        
        let data = BarChartData(dataSet: set)
        data.setValueFont(.systemFont(ofSize: 1, weight: .light))
        data.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        data.setValueTextColor(.white)
        
        chartView.fitBars = true
        chartView.data = data
    }
    
    override func optionTapped(_ option: Option) {
        super.handleOption(option, forChartView: chartView)
    }
    //MARK:- Custom Method
    func LoadAllViews()  {
        self.navTitle.text = StockListScreen.stockAnalysisString.localiz().uppercased()
        self.fromDateBtnOutlet.setTitle(betHistory.fromDateString.localiz(), for: .normal)
        self.toDateBtnOutlet.setTitle(betHistory.toDateString.localiz(), for: .normal)
        self.goBtnOutlet.setTitle(betHistory.goString.localiz(), for: .normal)
        self.sortByBtnOutlet.setTitle(betHistory.sortByString, for: .normal)
        self.fromDateView.setCornerRadiusOfView(cornerRadiusValue: 5)
        self.toDateView.setCornerRadiusOfView(cornerRadiusValue: 5)
        self.sortByView.setCornerRadiusOfView(cornerRadiusValue: 5)
        goBtnOutlet.setCornerRadiusOfButton(cornerRadiusValue: 10)
    }
    
    //MARK:- IBAction
    @IBAction func OnClickBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func OnClickFromDateButton(_ sender: UIButton) {
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
        self.getStockAnalysisAPI(userID: Identifier.username, fromDate: self.fromDateBtnOutlet.titleLabel?.text ?? "", toDate: self.toDateBtnOutlet.titleLabel?.text ?? "")
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
}

extension StockAnalysisViewController {
    /// Getting Stock
    func getStockAnalysisAPI(userID : String, fromDate : String, toDate : String) {
        if NetworkManager.sharedInstance.isInternetAvailable(){
            self.showHUD(progressLabel: AlertField.loaderString)
            let stateURL : String = UrlName.baseUrl + UrlName.stockAnalysisUrl
            let params = [PickerTitle.userId : userID, PickerTitle.postFromDate : fromDate, PickerTitle.postToDate : toDate]  as [String : Any]
            NetworkManager.sharedInstance.commonNetworkCallWithHeader(header: [:], url: stateURL, method: .post, parameters: params, completionHandler: { (json, status) in
                guard let jsonValue = json else {
                    self.dismissHUD(isAnimated: true)
                    return
                }
                self.stockAnalysis = Mapper<StockAnalysisModel>().map(JSONObject: jsonValue)
                if  self.stockAnalysis?.code == 200, self.stockAnalysis!.status {
                    if let list = self.stockAnalysis?.data, !list.isEmpty {
                        self.stockAnalysis?.data?.removeAll()
                        self.stockAnalysis?.data = list
                        super.handleOption(.animateXY, forChartView: self.chartView)
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
