//
//  News.swift
//  MajalMedia
//
//  Created by Ahmad Owais on 8/5/17.
//  Copyright © 2017 Ahmad Owais. All rights reserved.
//

import Foundation

class News{
    private var _nid : String!
    private var _node_type: String!
    private var _title:String!
    private var _author_id: String!
    private var _author_img: String!
    private var _fullurl: String!
    private var _details: String!
    private var _comment_count: String!
    private var _created_date: String!
    private var _view_count: String!
    private var _main_img: String!
    private var _section_name: String!
    private var _section_id: String!
    private var _tags: [Tags]!
    private var _countries: [Countries]!
    private var _is_followed: Bool!
    private var _page_name: String!
    private var _page_id: String!
    private var _page_details: String!
    private var _page_type: String!
    private var _page_logo: String!
    
    var nid: String {
        if _nid == nil{
            _nid = ""
        }
        return _nid
    }
    
}

struct Tags{
    private var _tag_name: String!
    private var _tag_id: String!
}

struct Countries{
    private var _country_name: String!
    private var _country_id: String!
}

//class Tags{
//    private var _tag_name: String!
//    private var _tag_id: String!
//    
//    var tag_name: String {
//        if _tag_name == nil{
//            _tag_name = ""
//        }
//        return _tag_name
//    }
//    
//    var tag_id: String {
//        if _tag_id == nil{
//            _tag_id = ""
//        }
//        return _tag_id
//    }
//}
