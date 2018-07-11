//
//  TopWikisResponse.swift
//  popular wikis list
//
//  Created by Łukasz Bożek on 18/06/2018.
//  Copyright © 2018 lu. All rights reserved.
//

import Foundation

struct TopWikisResponse: Codable {
    let batches: Int
    let items: [WikiaItem]
    let total: Int
    let currentBatch: Int
    let next: Int
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
