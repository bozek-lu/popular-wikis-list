//
//  WikiaItemStats.swift
//  popular wikis list
//
//  Created by Łukasz Bożek on 18/06/2018.
//  Copyright © 2018 lu. All rights reserved.
//

import Foundation

struct WikiaItemStats: Codable {
    let articles: Int
    let pages: Int
    let videos: Int
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
