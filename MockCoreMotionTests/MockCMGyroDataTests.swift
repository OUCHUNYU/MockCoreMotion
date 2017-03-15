//
//  MockCMGyroDataTests.swift
//  MockCoreMotion
//
//  Created by Chucha&Masha on 3/15/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

class MockCMGyroDataTests: XCTestCase {
    
    var testMockCMGyroData: MockCMGyroData?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testMockCMGyroData = MockCMGyroData()
    }
    
    override func tearDown() {
        testMockCMGyroData = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHasRotationRate() {
        XCTAssertNotNil(testMockCMGyroData?.rotationRate)
        XCTAssertEqual(testMockCMGyroData!.rotationRate.x, 0.0)
    }
    
    func testRotationRateIsMutable() {
        XCTAssertEqual(testMockCMGyroData!.rotationRate.x, 0.0)
        let testRotationRate = CMRotationRate(x: 1.0, y: 2.0, z: 3.0)
        testMockCMGyroData?.rotationRate = testRotationRate
        XCTAssertEqual(testMockCMGyroData!.rotationRate.x, testRotationRate.x)
    }
    
}
