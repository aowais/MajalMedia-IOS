//
//  MainVC.swift
//  MajalMedia
//
//  Created by Ahmad Owais on 8/3/17.
//  Copyright © 2017 Ahmad Owais. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    var token = Token()

    override func viewDidLoad() {
        super.viewDidLoad()

        token.downloadTokenDetails {
            //
        }
    }

}
