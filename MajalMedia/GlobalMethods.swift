//
//  GlobalMethods.swift
//  MajalMedia
//
//  Created by Ahmad Owais on 8/6/17.
//  Copyright © 2017 Ahmad Owais. All rights reserved.
//

import Foundation

class GlobalMethods{
    
    func getCurrentMillis()->Int64 {
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
    
}


