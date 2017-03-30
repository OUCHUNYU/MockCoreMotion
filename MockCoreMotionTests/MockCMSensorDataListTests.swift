//
//  MockCMSensorDataListTests.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 4/2/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

class MockCMSensorDataListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEnumerated() {
        let testMockCMSensorDataList = MockCMSensorDataList()
        
        testMockCMSensorDataList.enumerated().map({
            XCTAssertNotNil(($0.element as AnyObject).acceleration.x)
        })
        
//        SensorReading(timestamp: ($0.element as AnyObject).startDate, type: "a", x: ($0.element as AnyObject).acceleration.x, y: ($0.element as AnyObject).acceleration.y, z: ($0.element as AnyObject).acceleration.z) })
    }
    
}

extension MockCMSensorDataList: Sequence {
    public func makeIterator() -> NSFastEnumerationIterator {
        return NSFastEnumerationIterator(self)
    }
}
