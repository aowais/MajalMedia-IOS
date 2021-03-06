//
//  NewsDownload.swift
//  MajalMedia
//
//  Created by Ahmad Owais on 8/6/17.
//  Copyright © 2017 Ahmad Owais. All rights reserved.
//

import Foundation
import Alamofire

class NewsDownload{
    
    var news = [News]()
    
    func downloadNewsDetails(tok: Int64,page: Int,completed: @escaping DownloadNewsComplete){
        // Alamofire download
        let url = URL_Base+"?token="+String(tok)+"&page="+String(page)
        print("requsting:\(url)")
        let news_url = URL(string: url)!
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        manager.request(news_url)
            .responseJSON { response in
                switch (response.result) {
                case .success:
                    //do json stuff
                    let json = response.result.value
                    print("result: \(json!)") // leaving it without ! mark will print "optional" before the json string
                    if let dic = json as? Dictionary<String,AnyObject>{
                        if let success = dic["success"] as? Bool{
                            print("success: \(success)")
                            if success{
                                //get array of objects
                                if let data = dic["data"] as? [Dictionary<String,AnyObject>]{
                                    for item in data{
                                        let newsItem = News()
                                        
                                        if let nid = item["nid"]{
//                                          print("title:\(title)")
                                            let strInt = nid as! String
                                            newsItem._nid = Int64(strInt)
                                        }
                                        
                                        if let title = item["title"]{
//                                          print("title:\(title)")
                                            newsItem._title = title as! String
                                        }
                                        
                                        if let details = item["details"]{
//                                          print("title:\(title)")
                                            newsItem._details = details as! String
                                        }
                                        
                                        if let main_img = item["main_img"]{
                                            newsItem._main_img = main_img as! String
                                        }
                                        if let page_name = item["page_name"]{
                                            newsItem._page_name = page_name as! String
                                        }
                                        if let page_logo = item["page_logo"]{
                                            newsItem._page_logo = page_logo as! String
                                        }
                                        if let created_date = item["created_date"]{
                                            newsItem._created_date = created_date as! String
                                        }
                                        if let view_count = item["view_count"]{
                                            let intStr = view_count as! String
                                            newsItem._view_count = Int(intStr)
                                        }
                                        
                                        if let tags = item["tags"] as? [Dictionary<String,AnyObject>]{
                                            var tagsArray = [Tags]()
                                            for tag in tags{
                                                var tagItem = Tags()
                                                if let tag_name = tag["tag_name"]{
                                                    print("tag_name:\(tag_name)")
                                                    tagItem.tag_name = tag_name as! String
                                                }
                                                if let tag_id = tag["tag_id"]{
                                                    print("tag_id:\(tag_id)")
                                                    tagItem.tag_id = tag_id as! String
                                                }
                                                tagsArray.append(tagItem)
                                            }
                                            newsItem._tags = tagsArray
                                        }
                                        self.news.append(newsItem)
                                    }
                                    completed(self.news,true)
                                    self.news.removeAll()
                                }
                            }
                        }
                    }
                    break
                case .failure(let error):
                    if error._code == NSURLErrorTimedOut {
                        //HANDLE TIMEOUT HERE
                    }
                    print("\n\nAuth request failed with error:\n \(error)")
                    completed(nil,false)
                    break
                }
            }
        
        }
}
