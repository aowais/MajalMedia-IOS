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
    private var _success: Bool!
    private var _token: Int64!
    private var _ttl: Int64!
    var gmc = GlobalMethods()
    
    var success: Bool {
        return _success
    }
    
    var token: Int64 {
        return _token
    }
    
    var ttl: Int64 {
        return _ttl
    }
    
    func downloadTokenDetails(completed: @escaping DownloadComplete){
        // Alamofire download
        let tokendownload = URL(string: URL_Token)!
        let params: Parameters = [
            "app_key": app_key,
            "app_secret": app_secret
        ]
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        manager.request(tokendownload, method: .post, parameters: params)
            .responseJSON { response in
                switch (response.result) {
                case .success:
                    //do json stuff
                    let json = response.result.value
                    print("result: \(json!)") // leaving it without ! mark will print "optional" before the json string
                    if let dic = json as? Dictionary<String,AnyObject>{
                        if let success = dic["success"] as? Bool{
                            self._success = success
                            print("success: \(success)")
                            if success{
                                if let token = dic["token"] as? Int64{
                                    self._token = token
                                    print("token: \(token)")
                                }
                                
                                if let ttl = dic["ttl"] as? Int64{
                                    self._ttl = ttl
                                    print("ttl: \(ttl)")
                                }
                                let currentTime = self.gmc.getCurrentMillis()
                                let overTime = currentTime+self._ttl
                                self.saveInstance(token: self.token, ttl: overTime)
                                completed(true)
                            }
                            else{
                                completed(false)
                            }
                        }
                        else{
                            completed(false)
                        }
                    }
                    
                    break
                case .failure(let error):
                    if error._code == NSURLErrorTimedOut {
                        //HANDLE TIMEOUT HERE
                    }
                    print("\n\nAuth request failed with error:\n \(error)")
                    completed(false)
                    break
                }
        }
        
    }
    
    func saveInstance(token: Int64, ttl: Int64){
        let preferences = UserDefaults.standard
        
        preferences.set(token, forKey: "token")
        preferences.set(ttl, forKey: "ttl")
        preferences.synchronize()
    }
    
    func getToken() -> Int64{
        let preferences = UserDefaults.standard
        
        if preferences.object(forKey: "token") == nil {
            //  Doesn't exist
            return 0
        } else {
            let myVar = preferences.integer(forKey: "token")
            return Int64(myVar)
        }
    }
    
    func getTtl() -> Int64{
        let preferences = UserDefaults.standard
        
        if preferences.object(forKey: "ttl") == nil {
            //  Doesn't exist
            return 0
        } else {
            let myVar = preferences.integer(forKey: "ttl")
            return Int64(myVar)
        }
    }
    
}




