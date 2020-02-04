//
//  ShowUserProfileViewController.swift
//  ECGame
//
//  Created by hfcb on 1/25/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit

class ShowUserProfileViewController: UIViewController,UIScrollViewDelegate {

    //MARK:- IBOutlet
    @IBOutlet weak var bgScrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK:- Var/Let
    var newImage: UIImage!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = newImage
        //let minScale = bgScrollView.frame.size.width / imageView.frame.size.width;
        //bgScrollView.minimumZoomScale = minScale
        bgScrollView.minimumZoomScale = 0.1
        bgScrollView.maximumZoomScale = 4.0
        bgScrollView.zoomScale = 1.0
        bgScrollView.contentSize = imageView.frame.size
        bgScrollView.delegate = self
    }
        
    //MARK :- IBAction
    @IBAction func OnClickBackButton(_ sender: UIButton) {
        
        self.dismiss(animated:true, completion: nil)
    }
    
    //MARK:- Scroll Delegate
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
}
