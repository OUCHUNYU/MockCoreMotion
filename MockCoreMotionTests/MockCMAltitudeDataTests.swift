//
//  MockCMAltitudeDataTests.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/12/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

class MockCMAltitudeDataTests: XCTestCase {
    
    var testMockCMAltitudeData: MockCMAltitudeData?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testMockCMAltitudeData = MockCMAltitudeData(relativeAltitude: 0, pressure: 101325.00)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        testMockCMAltitudeData = nil
        super.tearDown()
    }
    
    func testRelativeAltitude() {
        XCTAssertEqual(testMockCMAltitudeData!.relativeAltitude, 0, "A new MockCMAltitudeData instance has relativeAltitude 0 meter")
        testMockCMAltitudeData?.relativeAltitude = 100
        XCTAssertEqual(testMockCMAltitudeData!.relativeAltitude, 100)
    }
    
    func testPressure() {
        XCTAssertEqual(testMockCMAltitudeData!.pressure, 101325.00, "A new MockCMAltitudeData instance has pressure 101325.00 based on 0 meter altitue and 10 - 20 degree C air temperture.")
        let testPressure = 131325.00
        testMockCMAltitudeData?.pressure = testPressure as NSNumber
        XCTAssertEqual(testMockCMAltitudeData?.pressure, testPressure as NSNumber)
    }
    
}
