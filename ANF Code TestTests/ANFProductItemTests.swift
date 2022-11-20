//
//  ANFProductItemTests.swift
//  ANF Code TestTests
//
//  Created by Rashad Abdul-Salam on 11/22/22.
//

import XCTest
@testable import ANF_Code_Test

final class ANFProductItemTests: XCTestCase, ANFTestCaseExpectationSettable {
    
    var expectation: XCTestExpectation = XCTestExpectation(description: "Testing \(String(describing: ANFProductItem.self))")
    var productProvider: ANFProductProviderService!
    var exploreData : Data!
    
    override func setUp() {
        do {
            exploreData = try JSONSerialization.data(withJSONObject: ANFExploreDataLoader.ExploreData as Any)
        } catch {
            print("Error \(error)")
        }
    }

    func testProductItemAndContentHaveAllAttributes() throws {
        self.makeExpectationDescription("Testing ProductItems and Content should provide all attributes.")
        
        let products = ANFProductItem.MakeProducts(from: exploreData)
        guard
            let product = products.first,
            let topDesc = product.topDescription,
            let bottomDesc = product.bottomDescription,
            let promoMess = product.promoMessage,
            let content = product.content,
            let firstContent = content.first,
            let lastContent = content.last
        else {
            XCTFail("Error: Products should not return Nil.")
            return
        }
        XCTAssertTrue(
            !product.title.isEmpty &&
            !product.backgroundImage.isEmpty &&
            !topDesc.isEmpty &&
            !bottomDesc.isEmpty &&
            !promoMess.isEmpty &&
            !firstContent.title.isEmpty &&
            !firstContent.target.isEmpty &&
            !lastContent.title.isEmpty &&
            !lastContent.target.isEmpty, "All Product and Content attributes should be present"
        )
            
        self.expectation.fulfill()
        
        self.setWaitTime()
    }

}
