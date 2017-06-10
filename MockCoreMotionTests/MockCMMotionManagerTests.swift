//
//  MockCMMotionManagerTests.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 5/20/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

class MockCMMotionManagerTests: XCTestCase {
    
    var testMockCMMotionManager: MockCMMotionManager?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testMockCMMotionManager = MockCMMotionManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        testMockCMMotionManager = nil
    }
    
    func testAllInstanceVariablesAreMutable() {
        XCTAssertFalse(testMockCMMotionManager!.isAccelerometerAvailable)
        XCTAssertFalse(testMockCMMotionManager!.isAccelerometerActive)
        XCTAssertFalse(testMockCMMotionManager!.isGyroAvailable)
        XCTAssertFalse(testMockCMMotionManager!.isGyroActive)
        XCTAssertFalse(testMockCMMotionManager!.isMagnetometerAvailable)
        XCTAssertFalse(testMockCMMotionManager!.isMagnetometerActive)
        XCTAssertFalse(testMockCMMotionManager!.isDeviceMotionAvailable)
        XCTAssertFalse(testMockCMMotionManager!.isDeviceMotionActive)
        
        testMockCMMotionManager!.isAccelerometerAvailable = true
        testMockCMMotionManager!.isAccelerometerActive = true
        testMockCMMotionManager!.isGyroAvailable = true
        testMockCMMotionManager!.isGyroActive = true
        testMockCMMotionManager!.isMagnetometerAvailable = true
        testMockCMMotionManager!.isMagnetometerActive = true
        testMockCMMotionManager!.isDeviceMotionAvailable = true
        testMockCMMotionManager!.isDeviceMotionActive = true
        
        XCTAssertTrue(testMockCMMotionManager!.isAccelerometerAvailable)
        XCTAssertTrue(testMockCMMotionManager!.isAccelerometerActive)
        XCTAssertTrue(testMockCMMotionManager!.isGyroAvailable)
        XCTAssertTrue(testMockCMMotionManager!.isGyroActive)
        XCTAssertTrue(testMockCMMotionManager!.isMagnetometerAvailable)
        XCTAssertTrue(testMockCMMotionManager!.isMagnetometerActive)
        XCTAssertTrue(testMockCMMotionManager!.isDeviceMotionAvailable)
        XCTAssertTrue(testMockCMMotionManager!.isDeviceMotionActive)
    }
    
}
