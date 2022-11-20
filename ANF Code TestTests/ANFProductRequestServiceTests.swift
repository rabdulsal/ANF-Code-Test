//
//  ANFProductRequestServiceTests.swift
//  ANF Code TestTests
//
//  Created by Rashad Abdul-Salam on 11/22/22.
//

import XCTest
@testable import ANF_Code_Test

final class ANFProductRequestServiceTests: XCTestCase, ANFTestCaseExpectationSettable {

    var expectation: XCTestExpectation = XCTestExpectation(description: "Testing \(String(describing: ANFProductProviderService.self))")
    
    var productRequestService: ANFProductRequestService!
    
    override func setUp() {
        self.productRequestService = ANFProductRequestService()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetProductData() throws {
        
        self.productRequestService.getProductData { products, error in
            if let err = error {
                XCTFail("ERROR: \(err.localizedDescription)")
                return
            }
            XCTAssertTrue(products.isEmpty == false, "Network call should NOT return empty array of ProductItems")
            self.expectation.fulfill()
        }
        self.setWaitTime()
    }

}
