//
//  WikiaItem.swift
//  popular wikis list
//
//  Created by Łukasz Bożek on 18/06/2018.
//  Copyright © 2018 lu. All rights reserved.
//

import Foundation

struct WikiaItem: Codable {
    var headline: String?
    var desc: String
    var stats: WikiaItemStats
    var url: String
    var image: String
    var domain: String
    var title: String
}

//{
//    "headline": "string",
//    "desc": "string",
//    "name": "string",
//    "stats":
//    "original_dimensions": {
//        "width": "integer",
//        "height": "integer"
//    },
//    "url": "string",
//    "image": "string",
//    "flags": [
//    "string"
//    ],
//    "domain": "string",
//    "wam_score": "number",
//    "id": "integer",
//    "lang": "string",
//    "topUsers": [
//    "string"
//    ],
//    "hub": "string",
//    "wordmark": "string",
//    "topic": "string",
//    "title": "string"
//}
