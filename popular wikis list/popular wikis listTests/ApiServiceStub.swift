//
//  ApiServiceStub.swift
//  popular wikis listTests
//
//  Created by Łukasz Bożek on 19/06/2018.
//  Copyright © 2018 lu. All rights reserved.
//

import Foundation
@testable import popular_wikis_list

class ApiServiceStub: ApiService {
    enum Mode {
        case success(Any?), failure(Error)
    }
    
    var success: ApiServiceSuccess?
    var failure: ApiServiceFailure?
    
    private var mode: Mode
    
    init(_ mode: Mode) {
        self.mode = mode
    }
    
    func start() {
        switch mode {
        case .success(let data):
            success?(data)
        case .failure(let error):
            failure?(error)
        }
    }
    
    func cancel() {}
    func restart() {}
}
