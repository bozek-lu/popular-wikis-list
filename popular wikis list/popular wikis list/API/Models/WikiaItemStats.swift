//
//  WikiaItemStats.swift
//  popular wikis list
//
//  Created by Łukasz Bożek on 18/06/2018.
//  Copyright © 2018 lu. All rights reserved.
//

import Foundation

struct WikiaItemStats: Codable {
    var articles: Int
    var pages: Int
    var videos: Int
}

//{
//        "users": "integer",
//        "articles": "integer",
//        "pages": "integer",
//        "admins": "integer",
//        "activeUsers": "integer",
//        "edits": "integer",
//        "videos": "integer",
//        "images": "integer"
//    },
