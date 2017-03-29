//
//  MockCMPedometerEventTests.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/29/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

class MockCMPedometerEventTests: XCTestCase {
    
    var testMockCMPedometerEvent: MockCMPedometerEvent?
    
    let testDate = Date()
    let testType = CMPedometerEventType.pause
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testMockCMPedometerEvent = MockCMPedometerEvent(date: testDate, type: testType)
    }
    
    override func tearDown() {
        testMockCMPedometerEvent = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAllVariablesAreMutable() {
        XCTAssertEqual(testMockCMPedometerEvent!.date, testDate)
        XCTAssertEqual(testMockCMPedometerEvent!.type, testType)
        
        let newDate = Date() + (Date().timeIntervalSinceNow - 10000)
        let newType = CMPedometerEventType.resume
        
        testMockCMPedometerEvent?.date = newDate
        testMockCMPedometerEvent?.type = newType
        
        XCTAssertEqual(testMockCMPedometerEvent!.date, newDate)
        XCTAssertEqual(testMockCMPedometerEvent!.type, newType)
    }
}
