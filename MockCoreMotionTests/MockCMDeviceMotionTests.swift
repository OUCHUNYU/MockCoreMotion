//
//  MockCMDeviceMotionTests.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/14/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

class MockCMDeviceMotionTests: XCTestCase {
    
    var testMockCMDeviceMotion: MockCMDeviceMotion?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testMockCMDeviceMotion = MockCMDeviceMotion()
    }
    
    override func tearDown() {
        testMockCMDeviceMotion = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAllInstanceVariables() {
        XCTAssertEqual(testMockCMDeviceMotion!.attitude.roll, 0)
        XCTAssertEqual(testMockCMDeviceMotion!.rotationRate.x, 0.0)
        XCTAssertEqual(testMockCMDeviceMotion!.gravity.x, 0.0)
        XCTAssertEqual(testMockCMDeviceMotion!.userAcceleration.x, 0.0)
        XCTAssertEqual(testMockCMDeviceMotion!.magneticField.field.x, 0.0)
        XCTAssertEqual(testMockCMDeviceMotion!.magneticField.accuracy, CMMagneticFieldCalibrationAccuracy.high)
        
        let testAttitude = MockCMAttitude()
        testAttitude.roll = 100.0
        let testRotationRate = CMRotationRate(x: 1.0, y: 1.0, z: 1.0)
        let testGravity = CMAcceleration(x: 2.0, y: 2.0, z: 2.0)
        let testUserAcc = CMAcceleration(x: 3.0, y: 3.0, z: 3.0)
        let testMag = CMCalibratedMagneticField(
            field: CMMagneticField(x: 4.0, y: 4.0, z: 4.0),
            accuracy: CMMagneticFieldCalibrationAccuracy.low
        )
        
        testMockCMDeviceMotion?.attitude = testAttitude
        testMockCMDeviceMotion?.rotationRate = testRotationRate
        testMockCMDeviceMotion?.gravity = testGravity
        testMockCMDeviceMotion?.userAcceleration = testUserAcc
        testMockCMDeviceMotion?.magneticField = testMag
        
        XCTAssertEqual(testMockCMDeviceMotion!.attitude.roll, testAttitude.roll)
        XCTAssertEqual(testMockCMDeviceMotion!.rotationRate.x, testRotationRate.x)
        XCTAssertEqual(testMockCMDeviceMotion!.gravity.x, testGravity.x)
        XCTAssertEqual(testMockCMDeviceMotion!.userAcceleration.x, testUserAcc.x)
        XCTAssertEqual(testMockCMDeviceMotion!.magneticField.field.x, testMag.field.x)
        XCTAssertEqual(testMockCMDeviceMotion!.magneticField.accuracy, testMag.accuracy)
    }
    
}
