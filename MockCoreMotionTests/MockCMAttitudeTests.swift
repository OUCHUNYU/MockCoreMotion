//
//  MockCMAttitudeTests.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/12/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

class MockCMAttitudeTests: XCTestCase {
    
    var testMockCMAttitude: MockCMAttitude?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testMockCMAttitude = MockCMAttitude(roll: 0, yaw: 0, pitch: 0, rotationMatrix: CMRotationMatrix(), quaternion: CMQuaternion())
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        testMockCMAttitude = nil
        super.tearDown()
    }
    
    func testAllInstanceVariables() {
        XCTAssertEqual(testMockCMAttitude!.roll, 0)
        XCTAssertEqual(testMockCMAttitude!.yaw, 0)
        XCTAssertEqual(testMockCMAttitude!.pitch, 0)
        XCTAssertNotNil(testMockCMAttitude!.rotationMatrix)
        XCTAssertNotNil(testMockCMAttitude!.quaternion)
        let testRoll = 5.0
        let testYaw = 10.0
        let testPitch = 4.0
        var testRotationMatrix = CMRotationMatrix()
        testRotationMatrix.m11 = 12345.12345
        var testQuaternion = CMQuaternion()
        testQuaternion.w = 123.123
        testMockCMAttitude?.roll = testRoll
        testMockCMAttitude?.yaw = testYaw
        testMockCMAttitude?.pitch = testPitch
        testMockCMAttitude?.rotationMatrix = testRotationMatrix
        testMockCMAttitude?.quaternion = testQuaternion
        XCTAssertEqual(testMockCMAttitude!.roll, testRoll)
        XCTAssertEqual(testMockCMAttitude!.yaw, testYaw)
        XCTAssertEqual(testMockCMAttitude!.pitch, testPitch)
        XCTAssertEqual(testMockCMAttitude!.rotationMatrix.m11, testRotationMatrix.m11)
        XCTAssertEqual(testMockCMAttitude!.quaternion.w, testQuaternion.w)
    }
    
    func testMultiply() {
        XCTAssertFalse(testMockCMAttitude!.multiplyCalled, "multiply() should never be called.")
        XCTAssertNil(testMockCMAttitude!.multiplyAttitude)
        let testAttitude = MockCMAttitude(roll: 0, yaw: 0, pitch: 0, rotationMatrix: CMRotationMatrix(), quaternion: CMQuaternion())
        testMockCMAttitude?.multiply(byInverseOf: testAttitude)
        XCTAssertTrue(testMockCMAttitude!.multiplyCalled, "multiply() should be called.")
        XCTAssertEqual(testMockCMAttitude!.multiplyAttitude, testAttitude)
    }
    
}
