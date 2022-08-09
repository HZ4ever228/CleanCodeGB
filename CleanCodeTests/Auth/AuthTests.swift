//
//  AuthTests.swift
//  CleanCodeTests
//
//  Created by Anton Hodyna on 09/08/2022.
//

import XCTest
@testable import CleanCode

class AuthTests: XCTestCase {
    
    let expectation = XCTestExpectation(
        description: "Download https://failUrl")
    var authRequstFactory: AuthRequestFactory!
    
    override func setUpWithError() throws {
        let requestFactory = RequestFactory()
        authRequstFactory = requestFactory.makeAuthRequestFatory()
    }
    
    override func tearDownWithError() throws {
        authRequstFactory = nil
    }
    
    func testLogin() throws {
        authRequstFactory.login(userName: "Somebody", password: "MyPassword") { response in
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
    
    func testRegister() throws {
        authRequstFactory.register(userId: -1, login: "Somebody", password: "mypassword", email: "", gender: "", creditCard: "", bio: "") { response in
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
    
    func testChangeUserData() throws {
        authRequstFactory.changeUserData(userId: -1, login: "Somebody", password: "mypassword", email: "test@mail.ru", gender: "third", creditCard: "", bio: "") { response in
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
    
    func testLogout() throws {
        authRequstFactory.logout(userID: -1) { response in
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
