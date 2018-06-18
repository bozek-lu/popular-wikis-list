//
//  ApiServiceTopWikisList.swift
//  popular wikis list
//
//  Created by Łukasz Bożek on 18/06/2018.
//  Copyright © 2018 lu. All rights reserved.
//

import Foundation

import Foundation

class ApiServiceTopWikisList: BaseApiService {
    override var requestUrl: String? {
        return "/List?expand=1&limit=\(limit)&batch=\(batch)"
    }
    
    private let batch: Int
    private let limit: Int
    
    init(limit: Int, batch: Int) {
        self.limit = limit
        self.batch = batch
        super.init()
        decoder = ApiResponseJSONDecoder<TopWikisResponse>()
    }
}
