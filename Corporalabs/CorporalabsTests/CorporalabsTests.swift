//
//  CorporalabsTests.swift
//  CorporalabsTests
//
//  Created by Juan Sánchez Marín on 2/1/22.
//

import XCTest
@testable import Corporalabs

class CorporalabsTests: XCTestCase {

    var apiManager = APIManager()

    override func setUp() {
        super.setUp()
    }

    func testGetAllArticles() {
        let exp = expectation(description: "Get All Articles")

        let params: APIParams = APIParams(articleType: "mostemailed", lastDaysType: "7")

        apiManager.fetchArticlesServer(params: params) { result, articles in
            switch result {
                case .success:
                    guard let articles = articles else { return XCTFail("Test failed testGetAllArticles") }
                    XCTAssertTrue(articles.count >= 0)
                case .error:
                    XCTFail("Test failed testGetAllArticles")
            }
            exp.fulfill()
        }

        waitForExpectations(timeout: 10) { (error) in
        }
    }

}
