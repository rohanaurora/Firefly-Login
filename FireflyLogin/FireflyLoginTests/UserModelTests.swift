//
//  UserModelTests.swift
//  FireflyLoginTests
//
//  Created by Rohan Aurora on 11/9/20.
//  Copyright © 2020 Rohan Aurora. All rights reserved.
//

import XCTest
@testable import FireflyLogin

class UserModelTests: XCTestCase {
    
    func testValidJSON() {
        if let path = Bundle.main.url(forResource:"MockUser", withExtension: "json") {
            let jsonData = try! Data(contentsOf: path)
            let user: User = try! JSONDecoder().decode(User.self, from: jsonData)
            
            XCTAssertEqual(user.username, "test123")
            XCTAssertEqual(user.isSuccessful, true)
        }
    }
    
    func testInvalidJSON() {
        if let path = Bundle.main.url(forResource:"MockUserInvalidData", withExtension: "json") {
            let jsonData = try! Data(contentsOf: path)
            
            do {
                let _ = try JSONDecoder().decode(User.self, from: jsonData)
            } catch {
                XCTFail("JSON should fail")
            }
        }
    }
}
