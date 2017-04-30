//
//  MockCMSensorRecorderTests.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 4/29/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

class MockCMSensorRecorderTests: XCTestCase {
    
    var testMockCMSensorRecorder: MockCMSensorRecorder?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testMockCMSensorRecorder = MockCMSensorRecorder()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStaticInterface() {
        XCTAssertFalse(MockCMSensorRecorder.isAuthorizedForRecording())
        XCTAssertFalse(MockCMSensorRecorder.isAccelerometerRecordingAvailable())
        
        MockCMSensorRecorder._isAuthorizedForRecording = true
        MockCMSensorRecorder._isAccelerometerRecordingAvailable = true
        
        XCTAssertTrue(MockCMSensorRecorder.isAuthorizedForRecording())
        XCTAssertTrue(MockCMSensorRecorder.isAccelerometerRecordingAvailable())
    }
    
    func testRecordAccelerometerAndAccelerometerDataWithDefaultSamplingRate() {
        let startDate = Date()
        let endDate = Date().addingTimeInterval(3600)
        // Set 30 seonds
        let duration = TimeInterval(30)
        testMockCMSensorRecorder?.recordAccelerometer(forDuration: duration)
        let resultDataList = testMockCMSensorRecorder?.accelerometerData(from: startDate, to: endDate)
        XCTAssertNotNil(resultDataList)
        var totalRecordedData = 0
        for _ in resultDataList as! MockCMSensorDataList {
            totalRecordedData += 1
        }
        XCTAssertEqual(totalRecordedData, 30 * testMockCMSensorRecorder!.samplingRate)
    }
    
    func testRecordAccelerometerAndAccelerometerDataWithDifferentSamplingRate() {
        testMockCMSensorRecorder = MockCMSensorRecorder(samplingRate: 100)
        let startDate = Date()
        let endDate = Date().addingTimeInterval(3600)
        // Set 30 seonds
        let duration = TimeInterval(30)
        testMockCMSensorRecorder?.recordAccelerometer(forDuration: duration)
        let resultDataList = testMockCMSensorRecorder?.accelerometerData(from: startDate, to: endDate)
        XCTAssertNotNil(resultDataList)
        var totalRecordedData = 0
        for _ in resultDataList as! MockCMSensorDataList {
            totalRecordedData += 1
        }
        XCTAssertEqual(totalRecordedData, 30 * testMockCMSensorRecorder!.samplingRate)
    }
    
    func testRecordAccelerometerDataMultipleTimes() {
        testMockCMSensorRecorder = MockCMSensorRecorder(samplingRate: 100)
        let startDate = Date()
        let endDate = Date().addingTimeInterval(3600)
        // Set 30 seonds
        let duration = TimeInterval(30)
        // Call recording for 5 times
        for _ in 0..<5 {
            testMockCMSensorRecorder?.recordAccelerometer(forDuration: duration)
        }
        let resultDataList = testMockCMSensorRecorder?.accelerometerData(from: startDate, to: endDate)
        XCTAssertNotNil(resultDataList)
        var totalRecordedData = 0
        for _ in resultDataList as! MockCMSensorDataList {
            totalRecordedData += 1
        }
        XCTAssertEqual(totalRecordedData, 5 * 30 * testMockCMSensorRecorder!.samplingRate)
    }
    
}
