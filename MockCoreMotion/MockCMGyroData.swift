//
//  MockCMGyroData.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

class MockCMGyroData: CMGyroData {
    private var _rotationRate: CMRotationRate = CMRotationRate(x: 0.0, y: 0.0, z: 0.0)
    private var _timestamp: TimeInterval = Date().timeIntervalSinceReferenceDate
    
    override var rotationRate: CMRotationRate {
        get {
            return _rotationRate
        }
        set {
            _rotationRate = newValue
        }
    }
    override var timestamp: TimeInterval {
        get {
            return _timestamp
        }
        set {
            _timestamp = newValue
        }
    }
}
