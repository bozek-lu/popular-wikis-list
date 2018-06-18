//
//  TopWikisResponse.swift
//  popular wikis list
//
//  Created by Łukasz Bożek on 18/06/2018.
//  Copyright © 2018 lu. All rights reserved.
//

import Foundation

struct TopWikisResponse: Codable {
    var batches: Int
    var items: [WikiaItem]
    var total: Int
    var currentBatch: Int
    var next: Int
}

//{
//    "batches": "integer",
//    "items": [
//    {
//    ],
//    "total": "integer",
//    "currentBatch": "integer",
//    "next": "integer"
//}
