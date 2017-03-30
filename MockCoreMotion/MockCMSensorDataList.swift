//
//  MockCMSensorDataList.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

open class MockCMSensorDataList: CMSensorDataList {
    // TODO:
    // Should be able to init with simple data sctructure like array of accData
    // after extend with secquence it can be iterated
    // can be iterated with #next
    public func next() -> MockCMRecordedAccelerometerData {
        let data = MockCMRecordedAccelerometerData(startDate: Date(), identifier: 1231)
        data.acceleration = CMAcceleration(x: 1.0, y: 2.0, z: 3.0)
        return data
    }
    
}
