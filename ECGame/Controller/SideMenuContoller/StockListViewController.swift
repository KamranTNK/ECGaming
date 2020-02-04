//
//  StockListViewController.swift
//  ECGame
//
//  Created by hfcb on 1/8/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit
import ObjectMapper

class StockListViewController: UIViewController,UIGestureRecognizerDelegate {

    //MARK:- Var/Let, IBOutlet
    @IBOutlet weak var stockListTableView: UITableView!
    @IBOutlet weak var navTitle: UILabel!
    
    //MARK:- Variables -
    var stockListModel : StockListModel?
    var timer: Timer!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getStockListAPI()
        self.loadBasicView()
        self.timer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(StockListViewController.refreshStockTableView), userInfo: nil, repeats: true)
    }
    
    //MARK:- Custom Method Action
    func loadBasicView() {
        navTitle.text = StockListScreen.stockListString.localiz().uppercased()
        let stockHeader =  self.stockListTableView.dequeueReusableCell(withIdentifier: StockListHeaderViewTableViewCell.className()) as! StockListHeaderViewTableViewCell
        stockHeader.stockNameTitle.text = StockListScreen.stockNameString.localiz().uppercased()
        stockHeader.livePriceTitle.text = StockListScreen.livePriceString.localiz().uppercased()
        stockHeader.referenceTitle.text = StockListScreen.referenceString.localiz().uppercased()
        self.stockListTableView.tableHeaderView = stockHeader
        
    }
    @objc func refreshStockTableView()
    {
        self.getStockListAPI()
    }
    func showTable(show : Bool)  {
        if show {
            self.stockListTableView.isHidden =  true
        }else {
            self.stockListTableView.isHidden =  false
        }
    }
   
     //MARK:- IBAction
    @IBAction func OnClickBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func tapEdit(recognizer: UITapGestureRecognizer)  {
        if recognizer.state == UIGestureRecognizer.State.ended {
            let tapLocation = recognizer.location(in: self.stockListTableView)
            if let tapIndexPath = self.stockListTableView.indexPathForRow(at: tapLocation) {
                if (self.stockListTableView.cellForRow(at: tapIndexPath) as? StockListTableViewCell) != nil {
                    let viewObj = appDelegate.getSidemenuStoryBoardSharedInstance().instantiateViewController(withIdentifier: RulesViewController.className()) as! RulesViewController
                    viewObj.requestURLString = self.stockListModel?.data?[tapIndexPath.row].stockReference ?? ""
                    viewObj.navTitleString = StockListScreen.referenceString.localiz().uppercased()
                    self.navigationController?.pushViewController(viewObj, animated: true)
                }
            }
        }
    }
}

//MARK:- TableView Delegate & Datasource
extension StockListViewController : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.stockListModel?.data?.count ?? 0 > 0 {
            return self.stockListModel!.data!.count
        }
        else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: StockListTableViewCell.className()) as! StockListTableViewCell
        cell.stockNameLabel.text = self.stockListModel?.data?[indexPath.row].stockName
        cell.stockLivePriceLabel.text = "\(self.stockListModel?.data?[indexPath.row].stockcurrentPrice ?? 0.0)"
        cell.stockReferenceLabel.text = self.stockListModel?.data?[indexPath.row].stockReference
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(StockListViewController.tapEdit(recognizer:)))
        tableView.addGestureRecognizer(tapGesture)
        tapGesture.delegate = self
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

}

// MARK:- API Call
extension StockListViewController {
    
    func getStockListAPI() {
        if NetworkManager.sharedInstance.isInternetAvailable(){
            self.showHUD(progressLabel: AlertField.loaderString)
            let stateURL : String = UrlName.timerUrl + UrlName.stockLivePriceUrl
            NetworkManager.sharedInstance.commonNetworkCallWithHeader(header: [:], url: stateURL, method: .get, parameters: nil, completionHandler: { (json, status) in
                guard let jsonValue = json else {
                    self.dismissHUD(isAnimated: true)
                    return
                }
                self.stockListModel = Mapper<StockListModel>().map(JSONObject: jsonValue)
                if  self.stockListModel?.code == 200, self.stockListModel!.status {
                    if let list = self.stockListModel?.data, !list.isEmpty {
                        
                    }else {
                        DispatchQueue.main.async {
                            self.makeToastInCenterWithMessage(DataResponse.noRecordFound)
                        }
                    }
                    self.stockListTableView.reloadData()
                }
                self.dismissHUD(isAnimated: true)
            })
        }else{
            self.showNoInternetAlert()
        }
    }
}
