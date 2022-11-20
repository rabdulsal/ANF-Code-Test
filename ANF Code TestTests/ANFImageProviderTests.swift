//
//  ANFImageProviderTests.swift
//  ANF Code TestTests
//
//  Created by Rashad Abdul-Salam on 11/21/22.
//

import XCTest
@testable import ANF_Code_Test

final class ANFImageProviderTests: XCTestCase, ANFTestCaseExpectationSettable {
    
    var expectation: XCTestExpectation = XCTestExpectation(description: "Testing \(String(describing: ANFImageProviderService.self))")
    
    let urlString = "http://anf.scene7.com/is/image/anf/anf-20160527-app-m-shirts?$anf-ios-fullwidth-3x$"
    
    var imageProviderService : ANFImageProviderService!
    
    override func setUp() {
        self.imageProviderService = ANFImageProviderService(urlStr: urlString)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchImage() throws {
        
        self.imageProviderService.fetchImage { image, error in
            if let err = error {
                XCTFail("ERROR: \(err.localizedDescription)")
                return
            }
            let imageIsNotNil = image != nil
            XCTAssertTrue(imageIsNotNil, "Returned image should not be nil.")
            self.expectation.fulfill()
        }
        self.setWaitTime()
    }

}
