//
//  MockCMLogItemTests.swift
//  MockCoreMotion
//
//  Created by Chucha&Masha on 3/19/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

class MockCMLogItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTimestamp() {
        let testTimestamp = Date().timeIntervalSinceReferenceDate
        let testMockCMLogItem = MockCMLogItem(timestamp: testTimestamp)
        
        XCTAssertEqual(testMockCMLogItem.timestamp, testTimestamp, "MockCMLogItem should init with custome timestamp")
        
        let newTestTimestamp = Date().timeIntervalSinceReferenceDate
        testMockCMLogItem.timestamp = newTestTimestamp
        XCTAssertEqual(testMockCMLogItem.timestamp, newTestTimestamp, "MockCMLogItem instance's timestamp can be change")
        XCTAssertNotEqual(testMockCMLogItem.timestamp, testTimestamp, "MockCMLogItem instance's timestamp is changed")
    }
    
}
