//
//  SettingsViewController.swift
//  ECGame
//
//  Created by hfcb on 04/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    //MARK:- IBOutlet
    @IBOutlet weak var viewTitleLabel: UILabel!
    @IBOutlet weak var SettingsTableView: UITableView!
    
    //MARK:- Let/Var
    var isSetBackgroundImage : Bool = true
    var isSetSwitchBackgroundImage : Bool = true
    var selectedindex : Int?
    
    //MARK:- Let/Var
    let sectionTitles = [SettingSection.account.localiz(), SettingSection.gameOptions.localiz()]
    let rowTitles = [[SettingRow.tutorial.localiz(), SettingRow.privacyPolicy.localiz(), SettingRow.termsCondition.localiz(), SettingRow.language.localiz(),SettingRow.chips.localiz()], [SettingRow.showPrimeMembership.localiz(), SettingRow.sound.localiz(), SettingRow.allowtoFellowme.localiz(), SettingRow.showmyOnlinestatus.localiz(), SettingRow.notificationsOnline.localiz()]]
    
    //MARK:- View Life -
    override func viewDidLoad() {
        super.viewDidLoad()
        viewTitleLabel.text = SettingSection.setting.localiz().uppercased()
        
    }
    
    //MARK:- IBAction
    @IBAction func OnClickBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- Cell Button Action
    @objc func btnAction(_ sender: AnyObject) {

        let viewObj = appDelegate.getSidemenuStoryBoardSharedInstance().instantiateViewController(withIdentifier: ClipsViewController.className()) as! ClipsViewController
        self.navigationController?.pushViewController(viewObj, animated: true)
            
    }
    @objc func everyonebtnAction(_ sender: AnyObject) {

        isSetBackgroundImage =  true
        let buttonPosition = sender.convert(CGPoint.zero, to: self.SettingsTableView)
        let indexPath = self.SettingsTableView.indexPathForRow(at: buttonPosition)
        selectedindex = indexPath?.row
        self.SettingsTableView.reloadRows(at: [indexPath!], with: UITableView.RowAnimation.none)
    }
    @objc func ononebtnAction(_ sender: AnyObject) {
        
        isSetBackgroundImage =  false
        let buttonPosition = sender.convert(CGPoint.zero, to: self.SettingsTableView)
        let indexPath = self.SettingsTableView.indexPathForRow(at: buttonPosition)
        selectedindex = indexPath?.row
        self.SettingsTableView.reloadRows(at: [indexPath!], with: UITableView.RowAnimation.none)
    }
    @objc func switchButtonAction(_ sender: AnyObject) {
        
        if (isSetSwitchBackgroundImage ==  true){
            isSetSwitchBackgroundImage =  false
        }else {
            isSetSwitchBackgroundImage =  true
        }
        let buttonPosition = sender.convert(CGPoint.zero, to: self.SettingsTableView)
        let indexPath = self.SettingsTableView.indexPathForRow(at: buttonPosition)
        selectedindex = indexPath?.row
        self.SettingsTableView.reloadRows(at: [indexPath!], with: UITableView.RowAnimation.none)
    }
    
}

//MARK:- TableView Delegate & Datasource
extension SettingsViewController : UITableViewDataSource,UITableViewDelegate {
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return self.rowTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return rowTitles[section].count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        return sectionTitles[section]
       
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear

            let headerLabel = UILabel(frame: CGRect(x: 20, y: 10, width:
                300, height: 30))
            headerLabel.font = UIFont(name: "Optima-Bold", size: 12)
            headerLabel.textColor = UIColor.white
            headerLabel.text = self.tableView(self.SettingsTableView, titleForHeaderInSection: section)
            headerLabel.sizeToFit()
            headerView.backgroundColor = CommonMethods.hexStringToUIColor(hex: Color.settingSectionColor)
            headerView.addSubview(headerLabel)

            return headerView
        }
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return 40
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var customCell = UITableViewCell()
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCommanTableViewCell.className(), for: indexPath) as! SettingsCommanTableViewCell
            cell.settingTitleLabel.text = rowTitles[indexPath.section][indexPath.row]
            if indexPath.row == 3 {
                cell.settingViewButton.setTitle(SettingRow.change.localiz(), for: .normal)
            }else if indexPath.row == 4 {
                cell.settingViewButton.addTarget(self, action: #selector(SettingsViewController.btnAction(_:)), for: .touchUpInside)
            }
            customCell =  cell
            
        }else if indexPath.section == 1 {
            
            if indexPath.row == 0 || indexPath.row == 2 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: SettingsSegmentTableViewCell.className(), for: indexPath) as! SettingsSegmentTableViewCell
                cell.settingTitleLabel.text = rowTitles[indexPath.section][indexPath.row]
                cell.everyoneBtn.addTarget(self, action: #selector(SettingsViewController.everyonebtnAction(_:)), for: .touchUpInside)
                cell.ononeBtn.addTarget(self, action: #selector(SettingsViewController.ononebtnAction(_:)), for: .touchUpInside)
                if selectedindex == indexPath.row{
                    if isSetBackgroundImage == true {
                        cell.segmentImageView.image = UIImage(named: "setting_segment")
                    }else {
                        cell.segmentImageView.image = UIImage(named: "show_onone")
                    }
                }
                customCell = cell
                
            }else if indexPath.row == 1 || indexPath.row == 3 || indexPath.row == 4 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: SettingSwitchTableViewCell.className(), for: indexPath) as! SettingSwitchTableViewCell
                cell.settingTitleLabel.text = rowTitles[indexPath.section][indexPath.row]
                if selectedindex == indexPath.row{
                    if (indexPath.row == 1) {
                        UserDefaults.standard.set(isSetSwitchBackgroundImage, forKey: UserDefaultsKey.isMusicOnOff)
                    }
                    if isSetSwitchBackgroundImage == true {
                        cell.switchButton.setBackgroundImage(UIImage(named: "SwitchOn"), for: .normal)
                    }else {
                        cell.switchButton.setBackgroundImage(UIImage(named: "swiftOff"), for: .normal)
                    }
                }
                cell.switchButton.addTarget(self, action: #selector(SettingsViewController.switchButtonAction(_:)), for: .touchUpInside)

                customCell = cell
            }
        }
        return customCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

