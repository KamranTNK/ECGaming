//
//  AppDelegate.swift
//  ECGame
//
//  Created by hfcb on 03/10/1941 Saka.
//  Copyright © 1941 tnk. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var selectedStockname = ""
    var selectedBTUName = ""
    var selectedTimeLoop = ""
    var dropdownArray = [String]()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initialSetup()
        sleep(2)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    var enableAllOrientation = false
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if (enableAllOrientation == true){
            //never excute in this app
            return UIInterfaceOrientationMask.allButUpsideDown
        }
        return UIInterfaceOrientationMask.landscape
    }

}

extension AppDelegate {
    /// Setting the initial data
    func initialSetup(){
        UserDefaults.standard.set(false, forKey: UserDefaultsKey.isProfileShow)
        IQKeyboardManager.shared.enable = true
        let islangSet = UserDefaults.init().bool(forKey: UserDefaultsKey.isLanguageDefinded)
        if !islangSet {
            LanguageManager.shared.defaultLanguage = .en
            LanguageManager.shared.currentLanguage = .en
        }
    }
    
    func getAppDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func getMainStoryBoardSharedInstance() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    func getSidemenuStoryBoardSharedInstance() -> UIStoryboard {
        return UIStoryboard(name: "SideMenu", bundle: nil)
    }
}
