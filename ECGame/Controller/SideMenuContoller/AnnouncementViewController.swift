//
//  AnnouncementViewController.swift
//  ECGame
//
//  Created by hfcb on 1/8/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit
import ObjectMapper

class AnnouncementViewController: UIViewController {
    
    //MARK:- IBOutlet
    @IBOutlet weak var announcementTableView: UITableView!
    @IBOutlet weak var navTitle: UILabel!
    
    //MARK:- Variables
    var announcementListModel : AnnouncementListModel?
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadBasicView()
    }
    
    //MARK:- Custom Method Action
    func loadBasicView() {
        navTitle.text = StockListScreen.announcementString.localiz().uppercased()
        let announceHeader = self.announcementTableView.dequeueReusableCell(withIdentifier: AnnouncementHeaderViewTableViewCell.className()) as! AnnouncementHeaderViewTableViewCell
        announceHeader.anounceTitle.text = StockListScreen.titleString.localiz().uppercased()
        announceHeader.previewTitle.text = StockListScreen.previewString.localiz().uppercased()
        announceHeader.dateTitle.text = StockListScreen.dateString.localiz().uppercased()
        self.announcementTableView.tableHeaderView = announceHeader
        self.getAnnouncementListAPI()
    }
    
    
    //MARK:- IBAction
    @IBAction func OnClickBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- TableView Delegate & Datasource
extension AnnouncementViewController : UITableViewDataSource,UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.announcementListModel?.data?.count ?? 0 > 0 {
            return self.announcementListModel!.data!.count
        }
        else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AnnouncementTableViewCell.className()) as! AnnouncementTableViewCell
        cell.announcementTitle.text = self.announcementListModel?.data?[indexPath.row].announcementTitle
        cell.announcementPreview.text = self.announcementListModel?.data?[indexPath.row].announcementMessageContent
        cell.announcementDate.text = self.announcementListModel?.data?[indexPath.row].announcementCreated_at
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
}

// MARK:- API Call
extension AnnouncementViewController {
    
    func getAnnouncementListAPI()  {
        if NetworkManager.sharedInstance.isInternetAvailable(){
            self.showHUD(progressLabel: AlertField.loaderString)
            let stateURL : String = UrlName.baseUrl + UrlName.announcementUrl
            NetworkManager.sharedInstance.commonNetworkCallWithHeader(header: [:], url: stateURL, method: .get, parameters: nil, completionHandler: { (json, status) in
                guard let jsonValue = json else {
                    self.dismissHUD(isAnimated: true)
                    return
                }
                self.announcementListModel = Mapper<AnnouncementListModel>().map(JSONObject: jsonValue)
                if  self.announcementListModel?.code == 200, self.announcementListModel!.status {
                    if let list = self.announcementListModel?.data, !list.isEmpty {
                        
                    }else {
                        DispatchQueue.main.async {
                                self.makeToastInCenterWithMessage(DataResponse.noRecordFound)
                        }
                    }
                    self.announcementTableView.reloadData()
                }
                self.dismissHUD(isAnimated: true)
            })
        }else{
            self.showNoInternetAlert()
        }
    }
}
