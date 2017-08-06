//
//  SplashVC.swift
//  MajalMedia
//
//  Created by Ahmad Owais on 8/3/17.
//  Copyright © 2017 Ahmad Owais. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    var token = Token()
    var gmc = GlobalMethods()
    @IBOutlet weak var loader: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loader.startAnimating()
        let storedTtl = token.getTtl()
        print("storedTtl: \(storedTtl)")
        let currentTime = gmc.getCurrentMillis()
        print("currentTime: \(currentTime)")
        if currentTime > storedTtl{
            token.downloadTokenDetails{ SUCCESS in
                if SUCCESS!{
                    print("download finished")
                    self.loader.stopAnimating()
                    self.performSegue(withIdentifier: "seg", sender: nil)
                }
                else{
                    print("SplashVC token error")
                }
            }
        }
        else{
            print("token within time, go to next view")
            gotNextView()
        }
//        gotNextView()
    }
    

    
    func gotNextView(){
        let deadlineTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
            //do here what you want
            self.loader.stopAnimating()
            self.performSegue(withIdentifier: "seg", sender: nil)
        })
    }
}

