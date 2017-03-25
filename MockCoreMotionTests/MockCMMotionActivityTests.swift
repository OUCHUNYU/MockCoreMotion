//
//  MockCMMotionActivityTests.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/24/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

class MockCMMotionActivityTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEverythingMutable() {
        let testMockCMMotionActivity = MockCMMotionActivity()
        XCTAssertFalse(testMockCMMotionActivity.walking, "Walking is default to false")
        XCTAssertFalse(testMockCMMotionActivity.stationary, "Stationary is default to false")
        XCTAssertFalse(testMockCMMotionActivity.running, "Running is default to false")
        XCTAssertFalse(testMockCMMotionActivity.automotive, "Automotive is default to false")
        XCTAssertFalse(testMockCMMotionActivity.unknown, "Unknown is default to false")
        XCTAssertFalse(testMockCMMotionActivity.cycling, "Cycling is default to false")
        XCTAssertNotNil(testMockCMMotionActivity.startDate, "A MockCMMotionActivity instance should have startData")
        XCTAssertEqual(testMockCMMotionActivity.confidence, .high, "A MockCMMotionActivity instance should have a high confidence")
        
        testMockCMMotionActivity.walking = true
        testMockCMMotionActivity.stationary = true
        testMockCMMotionActivity.running = true
        testMockCMMotionActivity.automotive = true
        testMockCMMotionActivity.unknown = true
        testMockCMMotionActivity.cycling = true

        let testStartData = Date().addingTimeInterval(60 * 60 * 24)
        
        testMockCMMotionActivity.startDate = testStartData
        testMockCMMotionActivity.confidence = .low
        
        XCTAssertTrue(testMockCMMotionActivity.walking, "Walking is now true")
        XCTAssertTrue(testMockCMMotionActivity.stationary, "Stationary is now true")
        XCTAssertTrue(testMockCMMotionActivity.running, "Running is now true")
        XCTAssertTrue(testMockCMMotionActivity.automotive, "Automotive is now true")
        XCTAssertTrue(testMockCMMotionActivity.unknown, "Unknown is now true")
        XCTAssertTrue(testMockCMMotionActivity.cycling, "Cycling is now true")
        XCTAssertEqual(testMockCMMotionActivity.startDate, testStartData, "The startDate should be equal to the testStartData we set")
        XCTAssertEqual(testMockCMMotionActivity.confidence, .low, "Confidence should be equal to low")
    }
    
}
