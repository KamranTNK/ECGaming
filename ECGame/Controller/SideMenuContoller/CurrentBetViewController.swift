//
//  CurrentBetViewController.swift
//  ECGame
//
//  Created by hfcb on 1/6/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit
import ObjectMapper

class CurrentBetViewController: UIViewController {

    //MARK: - IBOutlet's
    @IBOutlet weak var currentBetTableView: UITableView!
    @IBOutlet weak var navTitle: UILabel!

    //MARK:- Variables -
    var currentBetListModel : CurrentBetListModel?
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadBasicView()
    }
    
    //MARK:- Custom Method Action
    func loadBasicView() {
        navTitle.text = CurrentBetScreen.currentBetString.localiz().uppercased()
        let tableHeader = self.currentBetTableView.dequeueReusableCell(withIdentifier: CurrentBetheaderViewTableViewCell.className()) as! CurrentBetheaderViewTableViewCell
        tableHeader.betIdTitle.text = CurrentBetScreen.betIdString.localiz()
        tableHeader.betDetailTitle.text = CurrentBetScreen.betDetailsString.localiz()
        tableHeader.amountTitle.text = CurrentBetScreen.amountString.localiz()
        tableHeader.payoutTitle.text = CurrentBetScreen.payoutString.localiz()
        tableHeader.betStatusTitle.text = CurrentBetScreen.betStatusString.localiz()
        self.currentBetTableView.tableHeaderView = tableHeader
        self.getCurrentBetListAPI(userID: Identifier.username)
    }
    
    
    //MARK:- IBAction
    @IBAction func OnClickBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - TableView Delegate & Datasource
extension CurrentBetViewController : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.currentBetListModel?.data?.count ?? 0 > 0 {
            return self.currentBetListModel!.data!.count +  1
        }
        else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.last == self.currentBetListModel!.data!.count) {
            let cell = tableView.dequeueReusableCell(withIdentifier: CurrentBetFooterViewTableViewCell.className()) as! CurrentBetFooterViewTableViewCell
            cell.totalCurrentBetLabel.text = "\(self.currentBetListModel!.data!.count)"
            var total_count = 0
            for i in 0..<self.currentBetListModel!.data!.count  {
                total_count = total_count + (self.currentBetListModel?.data?[i].currentbetAmount)!
            }
            cell.totalCurrentBetAmountLabel.text = "\("$" + "\(total_count)")"
            cell.totalTitle.text = CurrentBetScreen.totalString.localiz()
            return cell
            
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CurrentBetTableViewCell.className()) as! CurrentBetTableViewCell
            cell.betIDLabel.text = self.currentBetListModel?.data?[indexPath.row].currentId
            cell.beAmounttLabel.text = "\(self.currentBetListModel?.data?[indexPath.row].currentbetAmount ?? 0)"
            cell.betPayoutLabel.text = "\(self.currentBetListModel?.data?[indexPath.row].currentpayoutAmount ?? 0)"
            cell.betDetailLabel.text = "\(self.currentBetListModel?.data?[indexPath.row].currentRule ?? "") \("(") \(self.currentBetListModel?.data?[indexPath.row].currentpayoutAmount ?? 0) \(")") \(self.currentBetListModel?.data?[indexPath.row].currentStockName ?? "") \(self.currentBetListModel?.data?[indexPath.row].currentLoops ?? "") \("Minute")"
            cell.pendingBtn.setTitle(CurrentBetScreen.pendingString.localiz().uppercased(), for: .normal)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
}

//MARK:- API Call
extension CurrentBetViewController {

    func getCurrentBetListAPI(userID : String)  {
        if NetworkManager.sharedInstance.isInternetAvailable(){
            self.showHUD(progressLabel: AlertField.loaderString)
            let stateURL : String = UrlName.baseUrl + UrlName.userRunningBetUrl + userID
            NetworkManager.sharedInstance.commonNetworkCallWithHeader(header: [:], url: stateURL, method: .post, parameters: nil, completionHandler: { (json, status) in
                guard let jsonValue = json else {
                    self.dismissHUD(isAnimated: true)
                    return
                }
                self.currentBetListModel = Mapper<CurrentBetListModel>().map(JSONObject: jsonValue)
                if  self.currentBetListModel?.code == 200, self.currentBetListModel!.status {
                    if let list = self.currentBetListModel?.data, !list.isEmpty {
                        
                    }else {
                        DispatchQueue.main.async {
                                self.makeToastInCenterWithMessage(DataResponse.noRecordFound)
                        }
                    }
                    self.currentBetTableView.reloadData()
                }
                self.dismissHUD(isAnimated: true)
            })
        }else{
            self.showNoInternetAlert()
        }
    }
}

