//
//  News.swift
//  MajalMedia
//
//  Created by Ahmad Owais on 8/5/17.
//  Copyright © 2017 Ahmad Owais. All rights reserved.

import Foundation

class News{
    var _nid : String!
    var _node_type: String!
    var _title:String!
    var _author_id: String!
    var _author_img: String!
    var _fullurl: String!
    var _details: String!
    var _comment_count: String!
    var _created_date: String!
    var _view_count: String!
    var _main_img: String!
    var _section_name: String!
    var _section_id: String!
    var _tags: [Tags]!
    var _countries: [Countries]!
    var _is_followed: Bool!
    var _page_name: String!
    var _page_id: String!
    var _page_details: String!
    var _page_type: String!
    var _page_logo: String!
    
    var nid: String {
        if _nid == nil{
            _nid = ""
        }
        return _nid
    }
    
    var node_type: String {
        if _node_type == nil{
            _node_type = ""
        }
        return _node_type
    }
    
    var title: String {
        if _title == nil{
            _title = ""
        }
        return _title
    }
    
    var author_id: String {
        if _author_id == nil{
            _author_id = ""
        }
        return _author_id
    }
    
    var author_img: String {
        if _author_img == nil{
            _author_img = ""
        }
        return _author_id
    }
    
    var fullurl: String {
        if _fullurl == nil{
            _fullurl = ""
        }
        return _fullurl
    }
    
    var details: String {
        if _details == nil{
            _details = ""
        }
        return _details
    }
    
    var comment_count: String {
        if _comment_count == nil{
            _comment_count = ""
        }
        return _comment_count
    }
    var created_date: String {
        if _created_date == nil{
            _created_date = ""
        }
        return _created_date
    }
    var view_count: String {
        if _view_count == nil{
            _view_count = ""
        }
        return _view_count
    }
    
    var main_img: String {
        if _main_img == nil{
            _main_img = ""
        }
        return _main_img
    }
    
    var section_name: String {
        if _section_name == nil{
            _section_name = ""
        }
        return _section_name
    }
    
    var section_id: String {
        if _section_id == nil{
            _section_id = ""
        }
        return _section_id
    }
    
    var page_name: String {
        if _page_name == nil{
            _page_name = ""
        }
        return _page_name
    }
    
    var page_id: String {
        if _page_id == nil{
            _page_id = ""
        }
        return _page_id
    }
    
    var page_details: String {
        if _page_details == nil{
            _page_details = ""
        }
        return _page_details
    }
    
    var page_type: String {
        if _page_type == nil{
            _page_type = ""
        }
        return _page_type
    }
    
    var page_logo: String {
        if _page_logo == nil{
            _page_logo = ""
        }
        return _page_logo
    }
    
    var tags: [Tags] {
        return _tags
    }
    
    var countries: [Countries] {
        return _countries
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
