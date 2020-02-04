//
//  RulesViewController.swift
//  ECGame
//
//  Created by hfcb on 1/9/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit
import WebKit

class RulesViewController: UIViewController, WKUIDelegate, UIApplicationDelegate, WKNavigationDelegate {
    
    //MARK:- IBOutlet
    @IBOutlet weak var customWebView: UIView!
    @IBOutlet weak var navTitle: UILabel!
    
    //MARK:- Let/Var
    var requestURLString = "http://159.138.129.40/ios/Rule/"
    var navTitleString = StockListScreen.ruleString.localiz()
    var webView: WKWebView!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBasicView()
    }
    //MARK: - Initials -
    func loadBasicView() -> Void {
        navTitle.text = navTitleString.uppercased()
        let webConfiguration = WKWebViewConfiguration()
        let customFrame = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: 0.0, height: self.customWebView.frame.size.height))
        self.webView = WKWebView (frame: customFrame , configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.customWebView.addSubview(webView)
        webView.topAnchor.constraint(equalTo: customWebView.topAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: customWebView.rightAnchor).isActive = true
        webView.leftAnchor.constraint(equalTo: customWebView.leftAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: customWebView.bottomAnchor).isActive = true
        webView.heightAnchor.constraint(equalTo: customWebView.heightAnchor).isActive = true
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.scrollView.bounces = false
        self.openUrl()
    }
    
    //MARK:- IBAction
    @IBAction func OnClickBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    //MARK:- Custom Method
    func openUrl() {
        let url = URL (string: requestURLString)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    func showActivityIndicator(show: Bool) {
        if show {
            self.showHUD(progressLabel: AlertField.loaderString)
        } else {
            self.dismissHUD(isAnimated: show)
        }
    }
    
    //MARK:- WKWebView Delegate
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        showActivityIndicator(show: false)
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showActivityIndicator(show: true)
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showActivityIndicator(show: false)
    }
}
