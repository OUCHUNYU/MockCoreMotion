//
//  MockCMMagnetometerDataTests.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/22/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

class MockCMMagnetometerDataTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMutableMagneticField() {
        let testCMMagneticFieldFirst = CMMagneticField(x: 0.0, y: 1.0, z: 2.0)
        let testMockCMMagnetometerData = MockCMMagnetometerData(magneticField: testCMMagneticFieldFirst)
        XCTAssertEqual(testMockCMMagnetometerData.magneticField.y, testCMMagneticFieldFirst.y)
        
        let testCMMagneticFieldSecond = CMMagneticField(x: 3.0, y: 4.0, z: 5.0)
        testMockCMMagnetometerData.magneticField = testCMMagneticFieldSecond
        XCTAssertEqual(testMockCMMagnetometerData.magneticField.y, testCMMagneticFieldSecond.y)
    }
    
}
