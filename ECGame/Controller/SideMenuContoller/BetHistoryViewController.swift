//
//  BetHistoryViewController.swift
//  ECGame
//
//  Created by hfcb on 1/7/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit
import ObjectMapper

class BetHistoryViewController: UIViewController,UIGestureRecognizerDelegate,datePickerOpen {
    
    //MARK: - IBOutlet
    @IBOutlet weak var mainBackView: UIView!
    @IBOutlet weak var viewTitleLabel: UILabel!
    @IBOutlet weak var betHistoryTableView: UITableView!
    @IBOutlet weak var fromDateBtnOutlet: UIButton!
    @IBOutlet weak var toDateBtnOutlet: UIButton!
    @IBOutlet weak var fromDateView: UIView!
    @IBOutlet weak var toDateView: UIView!
    @IBOutlet weak var goButtonOutlet: UIButton!
    @IBOutlet weak var dateView: UIView!
    
    //MARK:- Let/Var -
    var betHistoryListModel : BetHistoryListModel?
    var datePickerView = DatePickerView()
    var btnTag:Int = 0
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllViews()
    }
    
    //MARK:- Custom Method
    func loadAllViews() {
        self.viewTitleLabel.text = BetHistoryScreen.betHistoryString.localiz().uppercased()
        self.fromDateBtnOutlet.setTitle(PickerTitle.fromDateStrConstant.localiz(), for: .normal)
        self.toDateBtnOutlet.setTitle(PickerTitle.toDateStrConstant.localiz(), for: .normal)
        self.goButtonOutlet.setTitle(BetHistoryScreen.goString.localiz().uppercased(), for: .normal)
        self.getBetHistoryListAPI(userID: Identifier.username, fromDate: "", toDate: "", limit: 10)
        self.betHistoryTableView.tableHeaderView = self.betHistoryTableView.dequeueReusableCell(withIdentifier: BetHistoryHeaderViewTableViewCell.className())
        self.fromDateView.setCornerRadiusOfView(cornerRadiusValue: 5)
        self.toDateView.setCornerRadiusOfView(cornerRadiusValue: 5)
        goButtonOutlet.setCornerRadiusOfButton(cornerRadiusValue: 10)
        showTable(show: true)
    }
    func showTable(show : Bool)  {
        if show {
            self.dateView.isHidden = true
        }else {
            self.dateView.isHidden = false
        }
    }
    
    //MARK:- IBAction: -
    @IBAction func OnClickBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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
        self.getBetHistoryListAPI(userID: Identifier.username, fromDate: self.fromDateBtnOutlet.titleLabel?.text ?? "", toDate: self.toDateBtnOutlet.titleLabel?.text ?? "" , limit: 10)
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


//MARK: - TableView Delegate & Datasource
extension BetHistoryViewController : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.betHistoryListModel?.data?.count ?? 0 > 0 {
            return self.betHistoryListModel!.data!.count + 1
        }
        else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.last == self.betHistoryListModel!.data!.count) {
            let cell = tableView.dequeueReusableCell(withIdentifier: BetHistoryFooterViewTableViewCell.className()) as! BetHistoryFooterViewTableViewCell
            cell.betTotalCount.text = "\(self.betHistoryListModel!.data!.count)"
            var total_Amount_count = 0.00
            for i in 0..<self.betHistoryListModel!.data!.count  {
                total_Amount_count = total_Amount_count + (self.betHistoryListModel?.data?[i].betHistoryAmount)!
            }
            cell.betTotalAmount.text = "\("$" + "\(total_Amount_count)")"
            return cell
            
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: BetHistoryTableViewCell.className()) as! BetHistoryTableViewCell
            cell.betHistoryBetId.text = self.betHistoryListModel?.data?[indexPath.row].betHistorytId
            cell.betHistoryDate.text = self.betHistoryListModel?.data?[indexPath.row].betHistoryTime
            cell.betHistoryAmount.text = "\(self.betHistoryListModel?.data?[indexPath.row].betHistoryAmount ?? 0)"
            if("\(self.betHistoryListModel?.data?[indexPath.row].betHistoryAmount ?? 0)").hasPrefix("-"){
                
                cell.betHistoryAmount.textColor = .red
                
            }else {
                
                cell.betHistoryAmount.textColor = UIColor(red:120/255, green:186/255,blue:16/255,alpha:1)
            }
            cell.betHistoryPayout.text = "\(self.betHistoryListModel?.data?[indexPath.row].betHistorypayoutAmount ?? 0.00)"
            cell.betHistoryDetails.text =  "\(self.betHistoryListModel?.data?[indexPath.row].betHistoryRule ?? "") \("(") \(self.betHistoryListModel?.data?[indexPath.row].betHistorypayoutAmount ?? 0) \(")") \(self.betHistoryListModel?.data?[indexPath.row].betHistoryName ?? "") \(self.betHistoryListModel?.data?[indexPath.row].betHistoryLoops ?? "") \("Minute")"
            
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
}

//MARK:- API Call
extension BetHistoryViewController{
    
    func getBetHistoryListAPI(userID : String ,fromDate : String, toDate : String, limit : Int )  {
        if NetworkManager.sharedInstance.isInternetAvailable(){
            self.showHUD(progressLabel: AlertField.loaderString)
            let stateURL : String = UrlName.baseUrl + UrlName.betHistoryUrl
            
            let params = [PickerTitle.userId: userID, PickerTitle.postlimitString : String(limit) , PickerTitle.postFromDate : fromDate, PickerTitle.postToDate : toDate]  as [String : Any]
            NetworkManager.sharedInstance.commonNetworkCallWithHeader(header: [:], url: stateURL, method: .post, parameters: params, completionHandler: { (json, status) in
                guard let jsonValue = json else {
                    self.dismissHUD(isAnimated: true)
                    return
                }
                self.betHistoryListModel = nil
                self.betHistoryListModel = Mapper<BetHistoryListModel>().map(JSONObject: jsonValue)
                if  self.betHistoryListModel?.code == 200, self.betHistoryListModel!.status {
                    if let list = self.betHistoryListModel?.data, !list.isEmpty {
                        DispatchQueue.main.async {
                            self.showTable(show: false)
                        }
                        print(list)
                    }else {
                        DispatchQueue.main.async {
                            self.makeToastInCenterWithMessage(DataResponse.noRecordFound)
                        }
                    }
                    self.betHistoryTableView.reloadData()
                }
                self.dismissHUD(isAnimated: true)
            })
        }else{
            self.showNoInternetAlert()
        }
    }
}
