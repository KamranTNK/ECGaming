//
//  Delegates.swift
//  ECGame
//
//  Created by hfcb on 08/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import Foundation
import UIKit

//MARK:- Road Map Delegate
//This is the delegate for the RoadMapView. The RoadMapView visible when you launch application and user is signed-in. It is an XIB which later on added on GameViewController.

protocol RoadMapDelegate {
    func toggleRoadMapView(isRoadmapExpanded : Bool)
    func refreshDataofRoadmapWithSelecetedType(type : Int)
}

/* open side menu option */
protocol menuOpen:  class {
    func openMenuAction(selectedValue : Int, viewController : String)
}

/* open date picker view */
protocol datePickerOpen:  class {
    func opendatePickerAction(selectedDate : String)
}

//This is the delegate for the Languagepopup. The Languagepopup visible when you tap on change language, you will get a popup with countries flag buttons It is an XIB which later on added on GameViewController.

protocol LanguageDelegate {
    func changeSelectedLanguage(selectedLanguageIndex : Int)
}
