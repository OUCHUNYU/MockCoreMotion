//
//  MockCMRecordedAccelerometerDataTests.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/29/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

class MockCMRecordedAccelerometerDataTests: XCTestCase {

    var testMockCMRecordedAccelerometerData: MockCMRecordedAccelerometerData?
    
    let testStartDate = Date()
    let testIdentifier = UInt64(12312868712)
    let testAcceleration = CMAcceleration(x: 1.0, y: 2.0, z: 3.0)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testMockCMRecordedAccelerometerData = MockCMRecordedAccelerometerData(startDate: testStartDate, identifier: testIdentifier, acceleration: testAcceleration)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAllVariablesAreMutable() {
        XCTAssertEqual(testMockCMRecordedAccelerometerData!.acceleration.x, testAcceleration.x)
        XCTAssertEqual(testMockCMRecordedAccelerometerData!.startDate, testStartDate)
        XCTAssertEqual(testMockCMRecordedAccelerometerData!.identifier, testIdentifier)
        
        let newStartDate = Date() + (Date().timeIntervalSinceNow - 10000)
        let newIdentifier = UInt64(5558123871294)
        let newAcceleration = CMAcceleration(x: 2.0, y: 2.0, z: 3.0)
        
        testMockCMRecordedAccelerometerData?.startDate = newStartDate
        testMockCMRecordedAccelerometerData?.identifier = newIdentifier
        testMockCMRecordedAccelerometerData?.acceleration = newAcceleration
        
        XCTAssertEqual(testMockCMRecordedAccelerometerData!.acceleration.x, newAcceleration.x)
        XCTAssertEqual(testMockCMRecordedAccelerometerData!.startDate, newStartDate)
        XCTAssertEqual(testMockCMRecordedAccelerometerData!.identifier, newIdentifier)
    }
}
