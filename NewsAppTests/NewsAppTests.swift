//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by Amr Ahmed on 27/08/2021.
//

import XCTest

@testable import NewsApp

class NewsAppTests: XCTestCase {

    var dateFormatter : DateFormatter?
    var emptyDate : String?
    var nilDate  : String?
    var wrongFormat: String?
    var currentDateStr : String?
    
    override func setUp() {
        super.setUp()
        emptyDate = ""
        nilDate = nil
        wrongFormat = "wrongDateFormat"
        dateFormatter = DateFormatter()
        dateFormatter?.dateFormat = "dd MMM yyyy HH:mm"
        currentDateStr = dateFormatter?.string(from: Date())
    }
    
    func testEmptyDateReturnCurrentDate() throws {
        XCTAssertTrue(currentDateStr == emptyDate?.formateStringDate())
    }
    
    func testNilDateShouldReturnNil() throws{
        XCTAssertTrue(nil == nilDate?.formateStringDate())
    }
    
    func testWrongDateFormatShouldReturnCurrentDate() throws{
        XCTAssertTrue(currentDateStr  == wrongFormat?.formateStringDate())
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
