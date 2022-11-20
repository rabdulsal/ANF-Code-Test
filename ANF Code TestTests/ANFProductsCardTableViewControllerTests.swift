//
//  ANFProductsCardTableViewControllerTests.swift
//  ANF Code TestTests
//
//  Created by Rashad Abdul-Salam on 11/21/22.
//

import XCTest
@testable import ANF_Code_Test

final class ANFProductsCardTableViewControllerTests: XCTestCase, ANFTestCaseExpectationSettable {
    
    var expectation: XCTestExpectation = XCTestExpectation(description: "Testing \(String(describing: ANFProductsCardTableViewController.self))")
    
    var productsViewController: ANFProductsCardTableViewController!
    var productsProvider = ANFProductProviderService()

    override func setUp() {

        productsViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: ANFProductsCardTableViewController.Identifier) as? ANFProductsCardTableViewController
    }

    func test_numberOfSections_ShouldBeOne() {
        let numberOfSections = productsViewController.numberOfSections(in: productsViewController.tableView)
        XCTAssert(numberOfSections == 1, "table view should have 1 section")
    }
    
    func test_numRowsDisplayedMatchRowsReturned() {
        self.makeExpectationDescription("Testing Rows Displayed Equals Products Returned")
        
        self.productsProvider.getProductData { products in
            
            self.productsViewController.products = products
            let expectedNumRows = products.count
            let vcNumRows = self.productsViewController.tableView(self.productsViewController.tableView, numberOfRowsInSection: 0)
            XCTAssert(expectedNumRows == vcNumRows, "ProductsVC should show display same number of products returned from server.")
            
            self.expectation.fulfill()
        }
        self.setWaitTime()
    }
    
    func test_cellForRowAtIndexPath_topDescription_shouldNotBeBlank() {
        self.makeExpectationDescription("Testing TopDescription should not be Blank")
        
        self.productsProvider.getProductData { products in
            
            self.productsViewController.products = products
            let firstCell = self.productsViewController.tableView(self.productsViewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
            guard let topDescriptionLabel = firstCell.viewWithTag(2) as? UILabel, let topDescription = topDescriptionLabel.text else {
                XCTFail("TopDescription Label should not be nil")
                return
            }
            XCTAssertTrue(!topDescription.isEmpty && topDescriptionLabel.font == .systemFont(ofSize: 13.0), "TopDescription should not be blank")
            
            self.expectation.fulfill()
        }
        self.setWaitTime()
    }
    
    func test_cellForRowAtIndexPath_titleText_shouldNotBeBlank() {
        self.productsProvider.getProductData { products in
            self.productsViewController.products = products
            let firstCell = self.productsViewController.tableView(self.productsViewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
            
            guard
                let titleLabel = firstCell.viewWithTag(3) as? UILabel,
                let titleFont = titleLabel.font,
                let title = titleLabel.text else {
                XCTFail("TitleLabel should not be nil.")
                return
            }
            XCTAssertTrue(!title.isEmpty && titleFont == .boldSystemFont(ofSize: 17), "title should not be blank, and should be Bold font 17-point size")
            self.expectation.fulfill()
        }
        self.setWaitTime()
    }
    
    func test_cellForRowAtIndexPath_promoMessage_shouldNotBeBlank() {
        self.makeExpectationDescription("Testing PromoMessage Should not be Blank")
        
        self.productsProvider.getProductData { products in
            
            self.productsViewController.products = products
            let firstCell = self.productsViewController.tableView(self.productsViewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
            guard let promoLabel = firstCell.viewWithTag(4) as? UILabel, let promoMessage = promoLabel.text else {
                XCTFail("PromoLabel should not be nil")
                return
            }
            XCTAssertTrue(!promoMessage.isEmpty && promoLabel.font == .systemFont(ofSize: 11), "PromoMessage should not be blank and should be font size 11pt")
            
            self.expectation.fulfill()
        }
        self.setWaitTime()
        
        
    }
    
    func test_cellForRowAtIndexPath_bottomDescription_shouldNotBeBlank() {
        self.makeExpectationDescription("Testing BottomDescription Label should not be Blank")
        
        self.productsProvider.getProductData { products in
            
            self.productsViewController.products = products
            let firstCell = self.productsViewController.tableView(self.productsViewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
            guard
                let bottomDescriptionLabel = firstCell.viewWithTag(5) as? UILabel,
                let font = bottomDescriptionLabel.font,
                let bottomDescription = bottomDescriptionLabel.text else {
                XCTFail("BottomDescription should not be nil")
                return
            }
            print("BottomDescription font: \(font)")
            XCTAssertTrue(!bottomDescription.isEmpty, "BottomDescription Label should not be blank, and be of font size 13pt")
            
            self.expectation.fulfill()
        }
        self.setWaitTime()
    }
    
    func test_cellForRowAtIndexPath_ContentButton_shouldNotBeBlank() {
        self.makeExpectationDescription("Testing PromoMessage Label should not be Blank")
        
        self.productsProvider.getProductData { products in
            
            self.productsViewController.products = products
            let firstCell = self.productsViewController.tableView(self.productsViewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
            
            guard
                let contentTableView = firstCell.viewWithTag(6) as? UITableView,
                let contentCell = contentTableView.cellForRow(at: IndexPath(row:0,section: 0)) as? ANF_Code_Test.ANFProductContentDataCell,
                let contentButton = contentCell.contentButton,
                let titleLabel = contentButton.titleLabel,
                let font = titleLabel.font,
                let title = titleLabel.text else {
                XCTFail("ContentButton should not be nil")
                return
            }
            
            XCTAssertTrue(!title.isEmpty && font == .boldSystemFont(ofSize: 15), "ContentButton should not be blank, and title should be of font size 15pt")
            
            self.expectation.fulfill()
        }
        self.setWaitTime()
    }
    
    func test_cellForRowAtIndexPath_Second_ContentButton_shouldNotBeBlank() {
        self.makeExpectationDescription("Testing Second ContentButton should not be Blank")
        
        self.productsProvider.getProductData { products in
            
            self.productsViewController.products = products
            
            guard
                let firstCell = self.productsViewController.tableView(self.productsViewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? ANF_Code_Test.ANFProductItemCell,
                let contentTableView = firstCell.viewWithTag(6) as? UITableView,
                let contentCell = firstCell.tableView(contentTableView, cellForRowAt: IndexPath(row: 1, section: 0)) as? ANF_Code_Test.ANFProductContentDataCell,
                let contentButton = contentCell.contentButton,
                let titleLabel = contentButton.titleLabel,
                let title = titleLabel.text else {
                XCTFail("Second ContentButton should not be nil")
                return
            }
            XCTAssertTrue(!title.isEmpty && titleLabel.font == .boldSystemFont(ofSize: 15), "Second ContentButton should not be blank, and title should be of font size 15pt")
            
            self.expectation.fulfill()
        }
        self.setWaitTime()
    }

    

}
