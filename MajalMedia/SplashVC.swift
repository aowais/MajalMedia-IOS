//
//  SplashVC.swift
//  MajalMedia
//
//  Created by Ahmad Owais on 8/3/17.
//  Copyright © 2017 Ahmad Owais. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    @IBOutlet weak var loader: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loader.startAnimating()
        gotNextView()
    }
    
    func gotNextView(){
        let deadlineTime = DispatchTime.now() + .seconds(5)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
            //do here what you want
            self.loader.stopAnimating()
            self.performSegue(withIdentifier: "seg", sender: nil)
        })
    }
}

