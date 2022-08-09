//
//  ProductTests.swift
//  CleanCodeTests
//
//  Created by Anton Hodyna on 09/08/2022.
//

import XCTest
@testable import CleanCode

class ProductTests: XCTestCase {
    let expectation = XCTestExpectation(
        description: "Download https://failUrl")
    var productRequstFactory: ProductRequstFactory!
    
    override func setUpWithError() throws {
        let requestFactory = RequestFactory()
        productRequstFactory = requestFactory.makeProductRequestFatory()
    }
    
    override func tearDownWithError() throws {
        productRequstFactory = nil
    }
    
    func testGetProducts() throws {
        productRequstFactory.getProducts(pageNumber: 1, categoryID: 1) { response in
            switch response.result {
            case .success(_):
                break
            case .failure(_):
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetProduct() throws {
        productRequstFactory.getProduct(productID: -1) { response in
            switch response.result {
            case .success(_):
                break
            case .failure(_):
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
