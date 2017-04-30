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
    
    var testMockCMSensorDataList: MockCMSensorDataList?
    let testRecordedAccelerometerDataArray = [
        MockCMRecordedAccelerometerData(startDate: Date(), identifier: 1111111, acceleration: CMAcceleration(x: 1.0, y: 2.0, z: 3.0)),
        MockCMRecordedAccelerometerData(startDate: Date(), identifier: 2222222, acceleration: CMAcceleration(x: 4.0, y: 5.0, z: 6.0)),
        MockCMRecordedAccelerometerData(startDate: Date(), identifier: 3333333, acceleration: CMAcceleration(x: 7.0, y: 8.0, z: 9.0))
    ]
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testMockCMSensorDataList = MockCMSensorDataList(recordedAccelerometerDataArray: testRecordedAccelerometerDataArray)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEnumerationAndMutability() {
        var counter = 0
        for data in testMockCMSensorDataList! {
            let accRecordedData = data as! MockCMRecordedAccelerometerData
            XCTAssertEqual(accRecordedData.startDate, testRecordedAccelerometerDataArray[counter].startDate)
            XCTAssertEqual(accRecordedData.identifier, testRecordedAccelerometerDataArray[counter].identifier)
            XCTAssertEqual(accRecordedData.acceleration.x, testRecordedAccelerometerDataArray[counter].acceleration.x)
            XCTAssertEqual(accRecordedData.acceleration.y, testRecordedAccelerometerDataArray[counter].acceleration.y)
            XCTAssertEqual(accRecordedData.acceleration.z, testRecordedAccelerometerDataArray[counter].acceleration.z)
            counter += 1
        }
        
        let newRecordedAccelerometerDataArray = [
            MockCMRecordedAccelerometerData(startDate: Date(), identifier: 4444444, acceleration: CMAcceleration(x: 10.0, y: 11.0, z: 12.0)),
            MockCMRecordedAccelerometerData(startDate: Date(), identifier: 5555555, acceleration: CMAcceleration(x: 13.0, y: 14.0, z: 15.0)),
            MockCMRecordedAccelerometerData(startDate: Date(), identifier: 6666666, acceleration: CMAcceleration(x: 16.0, y: 17.0, z: 18.0))
        ]
        
        testMockCMSensorDataList!.recordedAccelerometerData = newRecordedAccelerometerDataArray
        
        counter = 0
        for data in testMockCMSensorDataList! {
            let accRecordedData = data as! MockCMRecordedAccelerometerData
            XCTAssertEqual(accRecordedData.startDate, newRecordedAccelerometerDataArray[counter].startDate)
            XCTAssertEqual(accRecordedData.identifier, newRecordedAccelerometerDataArray[counter].identifier)
            XCTAssertEqual(accRecordedData.acceleration.x, newRecordedAccelerometerDataArray[counter].acceleration.x)
            XCTAssertEqual(accRecordedData.acceleration.y, newRecordedAccelerometerDataArray[counter].acceleration.y)
            XCTAssertEqual(accRecordedData.acceleration.z, newRecordedAccelerometerDataArray[counter].acceleration.z)
            counter += 1
        }
    }
    
}
