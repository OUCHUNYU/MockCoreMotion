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
        
        for item in testMockCMSensorDataList {
            let data = item as! MockCMRecordedAccelerometerData
            XCTAssertNotNil(data.acceleration.x)
            print(data.acceleration.x)
        }
    }
    
}
