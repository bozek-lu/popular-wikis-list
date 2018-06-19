//
//  popular_wikis_listTests.swift
//  popular wikis listTests
//
//  Created by Łukasz Bożek on 18/06/2018.
//  Copyright © 2018 lu. All rights reserved.
//

import XCTest
@testable import popular_wikis_list

private extension WikiaItem {
    init(_ identifier: Int) {
        let sts = WikiaItemStats(articles: identifier * 1000, pages: identifier * 1000, videos: identifier * 1000)
        self.init(headline: "\(identifier)", desc: "\(identifier)", stats: sts, url: "", image: "", domain: "", title: "")
    }
}

class popular_wikis_listTests: XCTestCase {
    
    func testLoadDataWithNilData() {
        let sut = ViewControllerViewModel()
        let serviceBuilder: (Int, Int) -> ApiService = { limit, batch in
            return ApiServiceStub(.success(nil))
        }
        sut.serviceBuilder = serviceBuilder
        
        var successCalled = false
        var failureCalled = false
        var returnedError: Error?
        
        sut.loadData { completion in
            switch completion {
            case .success:
                successCalled = true
            case .failure(let error):
                returnedError = error
                failureCalled = true
            }
        }
        
        XCTAssertNotNil(returnedError)
        XCTAssertFalse(successCalled)
        XCTAssertTrue(failureCalled)
    }
    
    func testLoadDataWithIncorrectData() {
        let sut = ViewControllerViewModel()
        let fakeObject = Date()
        let serviceBuilder: (Int, Int) -> ApiService = { limit, batch in
            return ApiServiceStub(.success(fakeObject))
        }
        sut.serviceBuilder = serviceBuilder
        
        var successCalled = false
        var failureCalled = false
        var returnedError: Error?
        
        sut.loadData { completion in
            switch completion {
            case .success:
                successCalled = true
            case .failure(let error):
                returnedError = error
                failureCalled = true
            }
        }
        
        XCTAssertNotNil(returnedError)
        XCTAssertFalse(successCalled)
        XCTAssertTrue(failureCalled)
    }
    
    func testLoadDataWithCorrectData() {
        let sut = ViewControllerViewModel()
        let wikis = [WikiaItem(1), WikiaItem(2), WikiaItem(3)]
        let wikiaResponse = TopWikisResponse(batches: 4, items: wikis, total: 4, currentBatch: 1, next: 2)
        let serviceBuilder: (Int, Int) -> ApiService = { limit, batch in
            return ApiServiceStub(.success(wikiaResponse))
        }
        sut.serviceBuilder = serviceBuilder
        
        var successCalled = false
        var failureCalled = false
        var returnedError: Error?
        
        sut.loadData { completion in
            switch completion {
            case .success:
                successCalled = true
            case .failure(let error):
                returnedError = error
                failureCalled = true
            }
        }
        
        XCTAssertNil(returnedError)
        XCTAssertTrue(successCalled)
        XCTAssertFalse(failureCalled)
        XCTAssertEqual(sut.wikisList?.count, 3)
    }
    
    func testLoadDataFailed() {
        let sut = ViewControllerViewModel()
        let serviceBuilder: (Int, Int) -> ApiService = { limit, batch in
            return ApiServiceStub(.failure(ApiErrorsFactory.makeError(for: .invalidResponse)))
        }
        sut.serviceBuilder = serviceBuilder
        
        var successCalled = false
        var failureCalled = false
        var returnedError: Error?
        
        sut.loadData { completion in
            switch completion {
            case .success:
                successCalled = true
            case .failure(let error):
                returnedError = error
                failureCalled = true
            }
        }
        
        XCTAssertNotNil(returnedError)
        XCTAssertFalse(successCalled)
        XCTAssertTrue(failureCalled)
    }
    
}
