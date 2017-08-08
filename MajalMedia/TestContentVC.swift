//
//  TestContentVC.swift
//  MajalMedia
//
//  Created by Ahmad Owais on 8/8/17.
//  Copyright © 2017 Ahmad Owais. All rights reserved.
//

import UIKit

class TestContentVC: UIViewController {
    
    @IBOutlet weak var lbl: UILabel!
//    @IBOutlet weak var webview: UIWebView!
    var dataObject: AnyObject?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        webview.loadHTMLString(dataObject as! String, baseURL: NSURL(string: "")! as URL)
        lbl.text = dataObject as? String
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        webview.loadHTMLString(dataObject as! String,
//                               baseURL: NSURL(string: "") as! URL)
//    }

}
