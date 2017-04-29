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

    var result: NSArray = NSArray(
        array: [
            MockCMRecordedAccelerometerData(startDate: Date(), identifier: 1111111, acceleration: CMAcceleration(x: 1.0, y: 2.0, z: 3.0)),
            MockCMRecordedAccelerometerData(startDate: Date(), identifier: 2222222, acceleration: CMAcceleration(x: 4.0, y: 5.0, z: 6.0)),
            MockCMRecordedAccelerometerData(startDate: Date(), identifier: 3333333, acceleration: CMAcceleration(x: 7.0, y: 8.0, z: 9.0))
        ]
    )
    
    open override func countByEnumerating(with state: UnsafeMutablePointer<NSFastEnumerationState>, objects buffer: AutoreleasingUnsafeMutablePointer<AnyObject?>!, count len: Int) -> Int {
        return result.countByEnumerating(with: state, objects: buffer, count: len)
    }
    
}

extension MockCMSensorDataList: Sequence {
    public func makeIterator() -> NSFastEnumerationIterator {
        return NSFastEnumerationIterator(self)
    }
}
