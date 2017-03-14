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
    
    private var _acceleration: CMAcceleration?
    
    private var _timestamp: TimeInterval = Date().timeIntervalSinceReferenceDate
    
    open override var acceleration: CMAcceleration {
        get {
            return _acceleration ?? super.acceleration
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
    
    public init(acceleration: CMAcceleration) {
        _acceleration = acceleration
        super.init()
    }
    
    public required init?(coder: NSCoder) {
        if coder.containsValue(forKey: MockCMAccelerometerData.accelerationKey),
            let accelerationValue = coder.decodeObject(forKey: MockCMAccelerometerData.accelerationKey) as? CMAcceleration {
            _acceleration = accelerationValue
        }
        super.init(coder: coder)
    }
    
    private static let accelerationKey = "_acceleration"
    open override func encode(with coder: NSCoder) {
        coder.encode(acceleration, forKey: MockCMAccelerometerData.accelerationKey)
    }
    
}
