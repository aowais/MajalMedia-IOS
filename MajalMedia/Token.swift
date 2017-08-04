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
    
    func downloadTokenDetails(completed: DownloadComplete){
        // Alamofire download
        let tokendownload = URL(string: URL_Token)!
        let params: Parameters = [
            "app_key": "demo",
            "app_secret": "12345678"
        ]
        
//        let expectation = self.expectation(description: "should work")
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        manager.request(tokendownload, method: .post, parameters: params)
            .responseJSON { response in
                switch (response.result) {
                case .success:
                    //do json stuff
                    let json = response.result.value
                    print("result: \(json!)") // leaving it without ! mark will print "optional" before the json string
                    break
                case .failure(let error):
                    if error._code == NSURLErrorTimedOut {
                        //HANDLE TIMEOUT HERE
                    }
                    print("\n\nAuth request failed with error:\n \(error)")
                    break
                }
        }
        completed()
    }
}




