//
//  MockCMSensorRecorder.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion


open class MockCMSensorRecorder: CMSensorRecorder {
    
    private struct AccelerometerRecorder {
        var startTime: TimeInterval = 0.0
        var endTime: TimeInterval = 0.0
        var recordedData = [MockCMRecordedAccelerometerData]()
        
        func validateRecorderTimeWith(fromTimeInterval: TimeInterval, toTimeInterval: TimeInterval) -> Bool {
            if startTime >= fromTimeInterval && endTime <= toTimeInterval {
                return true
            } else {
                return false
            }
        }
    }
    
    private var accRecorderArray = [AccelerometerRecorder]()
    
    // Sampling rate when calling recordAccelerometer, default is 50hz
    var samplingRate = 50
    
    open override static func isAccelerometerRecordingAvailable() -> Bool {
        return _isAccelerometerRecordingAvailable ?? false
    }
    
    open override static func isAuthorizedForRecording() -> Bool {
        return _isAuthorizedForRecording ?? false
    }
    
    open override func accelerometerData(from fromDate: Date, to toDate: Date) -> CMSensorDataList? {
        let fromTimeInterval = fromDate.getMillisecondsSince1970()
        let toTimeInterval = toDate.getMillisecondsSince1970()
        var accDataArray = [MockCMRecordedAccelerometerData]()
        // Check all recorders that have start and end time within fromDate and toDate
        for recorder in accRecorderArray {
            if recorder.validateRecorderTimeWith(fromTimeInterval: fromTimeInterval, toTimeInterval: toTimeInterval) {
                accDataArray += recorder.recordedData
            }
        }
        if accDataArray.isEmpty {
            return nil
        }
        return MockCMSensorDataList(recordedAccelerometerDataArray: accDataArray)
    }
    
    open override func recordAccelerometer(forDuration duration: TimeInterval) {
        let startTs = Date().getMillisecondsSince1970()
        let endTs = startTs + duration * 1000000
        var dataArray = [MockCMRecordedAccelerometerData]()
        
        // create 50 recorded data per duration second
        for i in 0..<Int(round(duration)) {
            for _ in 0..<samplingRate {
                let recordedAcc = MockCMRecordedAccelerometerData(
                    startDate: Date(timeIntervalSince1970: startTs + Double(i)),
                    identifier: 1111111111,
                    acceleration: CMAcceleration(x: drand48(), y: drand48(), z: drand48())
                )
                dataArray.append(recordedAcc)
            }
        }
        
        let recorder = AccelerometerRecorder(startTime: startTs, endTime: endTs, recordedData: dataArray)
        
        accRecorderArray.append(recorder)
    }
    
    // Static Interface
    open static var _isAccelerometerRecordingAvailable: Bool?
    open static var _isAuthorizedForRecording: Bool?
    
    public override init() {}
    
    public init(samplingRate rate: Int) {
        samplingRate = rate
    }
}

extension Date {
    public func getMillisecondsSince1970() -> TimeInterval {
        return self.timeIntervalSince1970 * 1000000
    }
}
