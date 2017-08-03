//
//  Token.swift
//  MajalMedia
//
//  Created by Ahmad Owais on 8/3/17.
//  Copyright © 2017 Ahmad Owais. All rights reserved.
//

import UIKit
import Alamofire

class Token{
    var _success: Bool!
    var _token: Int32!
    var _ttl: Int32!
    
    
    var success: Bool {
        return _success
    }
    
    var token: Int32 {
        return _token
    }
    
    var ttl: Int32 {
        return _ttl
    }
}




