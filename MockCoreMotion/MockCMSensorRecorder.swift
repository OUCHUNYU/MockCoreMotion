//
//  MockCMSensorRecorder.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

// Design:
// We should follow the usage logic of this class
// use default 50hz data rate.
// Create a custom object that has start time, end time, datalist properties
// when ::recordAccelerometer called we should create an instance of the custom object.
// Base on 50 hz rate, we create certain amount of recordedAccData and wrappe them inside the custom object
// Then push this custome instance to an array

// When call accelerometerData with from time and end time
// we loop over the array find the custom objects that have starttime and endtime falls in this range
// combine all of the accelerometer data and init a datalist with acc data and return 
// if nothing found return nil


open class MockCMSensorRecorder: CMSensorRecorder {
    
    private struct AccelerometerRecorder {
        var startTime: TimeInterval = 0.0
        var endTime: TimeInterval = 0.0
        var recordedData = [MockCMRecordedAccelerometerData]()
    }
    
    private var recordedAccData: [Date: MockCMRecordedAccelerometerData] = [Date: MockCMRecordedAccelerometerData]()
    
    open override static func isAccelerometerRecordingAvailable() -> Bool {
        return _isAccelerometerRecordingAvailable ?? false
    }
    
    open override static func isAuthorizedForRecording() -> Bool {
        return _isAuthorizedForRecording ?? false
    }
    
    open override func accelerometerData(from fromDate: Date, to toDate: Date) -> CMSensorDataList? {
//        fromDate.timeIntervalSince1970
        return nil
    }
    
    open override func recordAccelerometer(forDuration duration: TimeInterval) {
        let startTs = Date().getMillisecondsSince1970()
        let endTs = startTs + duration
        var dataArray = [MockCMRecordedAccelerometerData]()
        for i in 0..<Int(round(duration)) {
            dataArray.append(MockCMRecordedAccelerometerData(
                startDate: Date(timeIntervalSince1970: startTs + Double(i)),
                identifier: ,
                acceleration: <#T##CMAcceleration#>
            )
        }
        let recorder = AccelerometerRecorder(
            startTime: startTs,
            endTime: endTs,
            recordedData: [MockCMRecordedAccelerometerData]
        )
        
    }
    
    // Static Interface
    open static var _isAccelerometerRecordingAvailable: Bool?
    open static var _isAuthorizedForRecording: Bool?
    
    // Instance Interface
    open var recordDuration: TimeInterval?
    
}

extension Date {
    public func getMillisecondsSince1970() -> TimeInterval {
        return self.timeIntervalSince1970 * 1000
    }
}
