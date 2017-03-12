//
//  MockCMAccelerometerData.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

open class MockCMAccelerometerData: CMAccelerometerData {
    
    private var _acceleration: CMAcceleration = CMAcceleration()
    
    private var _timestamp: TimeInterval = Date().timeIntervalSinceReferenceDate
    
    open override var acceleration: CMAcceleration {
        get {
            return _acceleration
        }
        set {
            _acceleration = newValue
        }
    }
    
    open override var timestamp: TimeInterval {
        get {
            return _timestamp
        }
        set {
            _timestamp = newValue
        }
    }
    
}
