//
//  MockCMPedometerTests.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/26/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

class MockCMPedometerTests: XCTestCase {
    
    var testMockCMPedometer: MockCMPedometer?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testMockCMPedometer = MockCMPedometer()
    }
    
    override func tearDown() {
        MockCMPedometer.flushState(instance: testMockCMPedometer!)
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStaticAvailabilityFunctions() {
        XCTAssertFalse(MockCMPedometer.isStepCountingAvailableCalled)
        XCTAssertFalse(MockCMPedometer.isDistanceAvailableCalled)
        XCTAssertFalse(MockCMPedometer.isFloorCountingAvailableCalled)
        XCTAssertFalse(MockCMPedometer.isPaceAvailableCalled)
        XCTAssertFalse(MockCMPedometer.isCadenceAvailableCalled)
        
        XCTAssertFalse(MockCMPedometer.isStepCountingAvailable())
        XCTAssertFalse(MockCMPedometer.isDistanceAvailable())
        XCTAssertFalse(MockCMPedometer.isFloorCountingAvailable())
        XCTAssertFalse(MockCMPedometer.isPaceAvailable())
        XCTAssertFalse(MockCMPedometer.isCadenceAvailable())
        
        MockCMPedometer._isStepCountingAvailable = true
        MockCMPedometer._isDistanceAvailable = true
        MockCMPedometer._isFloorCountingAvailable = true
        MockCMPedometer._isPaceAvailable = true
        MockCMPedometer._isCadenceAvailable = true

        XCTAssertTrue(MockCMPedometer.isStepCountingAvailableCalled)
        XCTAssertTrue(MockCMPedometer.isDistanceAvailableCalled)
        XCTAssertTrue(MockCMPedometer.isFloorCountingAvailableCalled)
        XCTAssertTrue(MockCMPedometer.isPaceAvailableCalled)
        XCTAssertTrue(MockCMPedometer.isCadenceAvailableCalled)
        
        XCTAssertTrue(MockCMPedometer.isStepCountingAvailable())
        XCTAssertTrue(MockCMPedometer.isDistanceAvailable())
        XCTAssertTrue(MockCMPedometer.isFloorCountingAvailable())
        XCTAssertTrue(MockCMPedometer.isPaceAvailable())
        XCTAssertTrue(MockCMPedometer.isCadenceAvailable())
    }
    
}
