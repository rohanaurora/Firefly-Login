//
//  LoginMockTests.swift
//  FireflyLoginTests
//
//  Created by Rohan Aurora on 11/7/20.
//  Copyright © 2020 Rohan Aurora. All rights reserved.
//

import XCTest
@testable import FireflyLogin

class LoginMockTests: XCTestCase {
    
    var client: NetworkClient!
    var mockSession: MockURLSession!

    override func tearDown() {
        client = nil
        mockSession = nil
        super.tearDown()
    }

    private func loadJsonData(file: String) -> Data? {
        if let url = Bundle.main.url(forResource:file, withExtension: "json") {
            if let jsonData = try? Data(contentsOf: url) {
                return jsonData
            }
        }
        return nil
    }

    private func createMockSession(fromJsonFile file: String, andStatusCode code: Int, andError error: Error?) -> MockURLSession? {
        let data = loadJsonData(file: file)
        let response = HTTPURLResponse(url: URL(string: Links.mockURL)!, statusCode: code, httpVersion: nil, headerFields: nil)
        return MockURLSession(completionHandler: (data, response, error))
    }
    
    func testNetworkClient_successResult() {
        mockSession = createMockSession(fromJsonFile: "User", andStatusCode: 200, andError: nil)
        client = NetworkClient(withSession: mockSession)
        client.requestLogin(url: URL(string: Links.mockURL)!) { (result, errorMessage) in
            XCTAssertNotNil(result)
            XCTAssertNil(errorMessage)
            let username = result?.user.username!
            XCTAssertTrue(username == "test123", "Username did not match.")
            let success = result?.user.isSuccessful!
            XCTAssertTrue(success == true, "isSuccessful flag did not match.")
        }
    }
    
    func testNetworkClient_404Result() {
        mockSession = createMockSession(fromJsonFile: "User", andStatusCode: 404, andError: nil)
        client = NetworkClient(withSession: mockSession)
        client.requestLogin(url: URL(string: "TestUrl")!) { (result, errorMessage) in
            XCTAssertNotNil(errorMessage)
            XCTAssertNil(result)
            XCTAssertTrue(errorMessage == "Bad Url")
        }
    }
    
    func testNetworkClient_NoData() {
        mockSession = createMockSession(fromJsonFile: "A", andStatusCode: 500, andError: nil)
        client = NetworkClient(withSession: mockSession)
        client.requestLogin(url: URL(string: Links.mockURL)!) { (result, errorMessage) in
            XCTAssertNotNil(errorMessage)
            XCTAssertNil(result)
            XCTAssertTrue(errorMessage == "No Data")
        }
    }
    
    func testNetworkClient_AnotherStatusCode() {
        mockSession = createMockSession(fromJsonFile: "User", andStatusCode: 401, andError: nil)
        client = NetworkClient(withSession: mockSession)
        client.requestLogin(url: URL(string: Links.mockURL)!) { (result, errorMessage) in
            XCTAssertNotNil(errorMessage)
            XCTAssertNil(result)
            XCTAssertTrue(errorMessage == "statusCode: 401")
        }
    }
}
