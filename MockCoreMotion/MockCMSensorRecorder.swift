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
    
    private var recordedAccData: [Date: MockCMRecordedAccelerometerData] = [Date: MockCMRecordedAccelerometerData]()
    
    open override static func isAccelerometerRecordingAvailable() -> Bool {
        return _isAccelerometerRecordingAvailable ?? false
    }
    
    open override static func isAuthorizedForRecording() -> Bool {
        return _isAuthorizedForRecording ?? false
    }
    
    open override func accelerometerData(from fromDate: Date, to toDate: Date) -> CMSensorDataList? {
        
        return nil
    }

    // TODO: Should generate date for in 50hz for this duration 10 seconds = 500 samples
    //       Should also record both start time and end time of this duration, so the 
    //       accelerometerData() can pass in time params to retrieve. If no recorded we return nil
    
    // TODO: Make a data frame that associate with a start time, map it to an object such as
    //        {
    //           starting timstamp: {
    //                                 duration: 10 second
    //                                 data: [data1, data2, data3]
    //                              }
    //         }
    //       This way all those calls to recordAccelerometer with duration can be recorded for a single
    //       MockCMSensorRecorder instance. Then when call accelerometerData, we have all those recorded
    //       data to return or return nil
    
    open override func recordAccelerometer(forDuration duration: TimeInterval) {
        recordDuration = duration
        // TODO:
        // get current Date() as key
        // directly creats duration * 50 data samples as associated value for this key
//        MockCMSensorDataList()
    }
    
    // Static Interface
    open static var _isAccelerometerRecordingAvailable: Bool?
    open static var _isAuthorizedForRecording: Bool?
    
    // Instance Interface
    open var recordDuration: TimeInterval?
    
}
