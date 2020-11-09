//
//  StringTests.swift
//  FireflyLoginTests
//
//  Created by Rohan Aurora on 11/7/20.
//  Copyright © 2020 Rohan Aurora. All rights reserved.
//

import XCTest
@testable import FireflyLogin

class StringTests: XCTestCase {
    
    func testContainsNumberAndLetter() {
        let input = "test123"
        let validated = input.hasLetterAndNumber
        let expected = true
        XCTAssertEqual(expected, validated)
    }
    
    func testContainsNumberOnly() {
        let input = "33444"
        let validated = input.hasLetterAndNumber
        let expected = false
        XCTAssertEqual(expected, validated)
    }
    
    func testContainsStringOnly() {
        let input = "ddddee"
        let validated = input.hasLetterAndNumber
        let expected = false
        XCTAssertEqual(expected, validated)
    }
    
    func testContainsSpecialCharsWithNumbers() {
        let input = "dddd32@gmail.com"
        let validated = input.hasLetterAndNumber
        let expected = true
        XCTAssertEqual(expected, validated)
    }
    
    func testContainsNoEntry() {
        let input = "dddd32@gmail.com"
        let validated = input.hasLetterAndNumber
        let expected = true
        XCTAssertEqual(expected, validated)
    }
    
    func testContainsOneNumberOneLetter() {
        let input = "d2"
        let validated = input.hasLetterAndNumber
        let expected = true
        XCTAssertEqual(expected, validated)
    }
    
    func testStartingWithNumber() {
        let input = "223333#s3#33dd"
        let validated = input.hasLetterAndNumber
        let expected = true
        XCTAssertEqual(expected, validated)
    }
}
