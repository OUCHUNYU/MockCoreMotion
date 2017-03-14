//
//  MockCMAccelerometerDataTests.swift
//  MockCoreMotion
//
//  Created by Chucha&Masha on 3/12/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

class MockCMAccelerometerDataTests: XCTestCase {
    
    var testMockCMAccelerometerData: MockCMAccelerometerData?
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        testMockCMAccelerometerData = nil
    }
    
    func testAcceleration() {
        var testCMAcceleration = CMAcceleration()
        let testX = 0.123
        let testY = 0.456
        let testZ = 0.789
        testCMAcceleration.x = testX
        testCMAcceleration.y = testY
        testCMAcceleration.z = testZ
        testMockCMAccelerometerData = MockCMAccelerometerData(acceleration: testCMAcceleration)
        XCTAssertNotNil(testMockCMAccelerometerData?.acceleration, "MockCMAccelerometerData instance should have acceleration data")
        XCTAssertEqual(testMockCMAccelerometerData?.acceleration.x, testX)
        XCTAssertEqual(testMockCMAccelerometerData?.acceleration.y, testY)
        XCTAssertEqual(testMockCMAccelerometerData?.acceleration.z, testZ)
    }
    
}
