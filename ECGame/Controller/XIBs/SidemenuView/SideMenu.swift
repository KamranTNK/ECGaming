//
//  SideMenu.swift
//  ECGame
//
//  Created by hfcb on 13/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit
import SwiftyJSON
import SimpleAnimation


class SideMenu: UIView, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var menuTableView: UITableView!
    weak var delegate:menuOpen?
    var menuArray = [JSON]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadInitialViewWithJsonFile()
    }
    func loadInitialViewWithJsonFile() {
        
        //Table view delegate and datasource
        menuTableView.delegate = self
        menuTableView.dataSource = self
        //Register XIB to the tableView
        menuTableView.register(UINib(nibName: MenuTableViewCell.className(), bundle: nil), forCellReuseIdentifier: MenuTableViewCell.className())
        //Remove extra cells from tableView
        menuTableView.tableFooterView = UIView()
        readJsonFromBunble()
    }
  
    func readJsonFromBunble() {
        if let path = Bundle.main.path(forResource: "SideMenuNew", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let sideMenu = try! JSON(data: data)
                self.menuArray = []
                if let sideMenuArr = sideMenu.array {
                    self.menuArray = sideMenuArr
                    menuTableView.reloadData()
                }
            } catch {
                
            }
        }
    }
    
    @IBAction func closeMenuAction(_ sender: Any) {
        self.popIn()
        self.removeFromSuperview()
    }
    
}

extension SideMenu {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = menuTableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.className()) as? MenuTableViewCell
        if cell == nil {
            menuTableView.register(UINib(nibName: MenuTableViewCell.className(), bundle: nil), forCellReuseIdentifier: MenuTableViewCell.className())
        }
         
        cell?.menuImageView.image = UIImage(named: menuArray[indexPath.row]["imageName"].string!)
        cell?.menuLabel.text = menuArray[indexPath.row]["menuname"].string?.localiz()
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
     
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.popIn()
        self.removeFromSuperview()
        delegate?.openMenuAction(selectedValue: indexPath.row, viewController: menuArray[indexPath.row]["viewController"].string!)
    }
}
