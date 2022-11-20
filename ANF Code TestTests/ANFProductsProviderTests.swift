//
//  ANFProductsProviderTests.swift
//  ANF Code TestTests
//
//  Created by Rashad Abdul-Salam on 11/21/22.
//

import XCTest
@testable import ANF_Code_Test

final class ANFProductsProviderTests: XCTestCase, ANFTestCaseExpectationSettable {

    var expectation: XCTestExpectation = XCTestExpectation(description: "Testing \(String(describing: ANFProductProviderService.self))")
    
    var productRequestService: ANFProductProviderService!
    
    override func setUp() {
        self.productRequestService = ANFProductProviderService()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetProductData() throws {
        
        self.productRequestService.getProductData { products in
            XCTAssertTrue(products.isEmpty == false, "Network call should NOT return empty array of ProductItems")
            self.expectation.fulfill()
        }
        self.setWaitTime()
    }

}
