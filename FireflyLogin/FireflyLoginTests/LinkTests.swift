//
//  LinkTests.swift
//  FireflyLoginTests
//
//  Created by Rohan Aurora on 11/9/20.
//  Copyright © 2020 Rohan Aurora. All rights reserved.
//

import XCTest
@testable import FireflyLogin

class LinkTests: XCTestCase {

        func testURLRequest() {
            let urlComponents = URLComponents(url: URL(string: Links.mockURL)!, resolvingAgainstBaseURL: false)
            XCTAssertEqual(urlComponents?.scheme, "https")
            XCTAssertEqual(urlComponents?.host , "fireflysoftware.ca")
            XCTAssertEqual(urlComponents?.path, "/login")
        }
    }
