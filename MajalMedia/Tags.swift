//
//  Tags.swift
//  MajalMedia
//
//  Created by Ahmad Owais on 8/13/17.
//  Copyright © 2017 Ahmad Owais. All rights reserved.
//

import Foundation

struct Tags{
    private var _tag_name: String!
    private var _tag_id: String!
    
//    var tag_name: String {
//        if _tag_name == nil{
//            _tag_name = ""
//        }
//        return _tag_name
//    }
    
    var tag_name: String{
        get{
            return _tag_name
        }
        set{
            _tag_name = newValue
        }
    }
    
    var tag_id: String{
        get{
            return _tag_id
        }
        set{
            _tag_id = newValue
        }
    }
    
}
