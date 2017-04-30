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
    
    private var data = NSArray(array: [MockCMRecordedAccelerometerData]())
    
    open var recordedAccelerometerData: Array<MockCMRecordedAccelerometerData> {
        get {
            var result = [MockCMRecordedAccelerometerData]()
            for item in data {
                result.append(item as! MockCMRecordedAccelerometerData)
            }
            return result
        }
        set(newValue) {
            self.data = NSArray(array: newValue)
        }
    }
    
    public init(recordedAccelerometerDataArray: [MockCMRecordedAccelerometerData]) {
        super.init()
        recordedAccelerometerData = recordedAccelerometerDataArray
    }
    
    open override func countByEnumerating(with state: UnsafeMutablePointer<NSFastEnumerationState>, objects buffer: AutoreleasingUnsafeMutablePointer<AnyObject?>!, count len: Int) -> Int {
        return data.countByEnumerating(with: state, objects: buffer, count: len)
    }
    
}

// Conform Sequence to enable iterating abilities
extension MockCMSensorDataList: Sequence {
    public func makeIterator() -> NSFastEnumerationIterator {
        return NSFastEnumerationIterator(self)
    }
}
