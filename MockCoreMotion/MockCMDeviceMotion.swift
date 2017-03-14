//
//  MockCMDeviceMotion.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

open class MockCMDeviceMotion: CMDeviceMotion {
    private var _timestamp: TimeInterval = Date().timeIntervalSinceReferenceDate
    private var _attitude: CMAttitude = MockCMAttitude()
    // CMRotationRate has initalizer that takes data such as x y z,
    private var _rotationRate: CMRotationRate = CMRotationRate(x: 0.0, y: 0.0, z: 0.0)
    // CMAcceleration has initalizer that takes data such as x y z,
    // NOTE: The total acceleration of the device is equal to gravity
    // plus the acceleration the user imparts to the device
    private var _gravity: CMAcceleration = CMAcceleration(x: 0.0, y: 0.0, z: 0.0)
    private var _userAcceleration: CMAcceleration = CMAcceleration(x: 0.0, y: 0.0, z: 0.0)
    // CMCalibratedMagneticField, CMMagneticField, CMMagneticFieldCalibrationAccuracy
    // all can be intialized without mocking
    private var _magneticField: CMCalibratedMagneticField = CMCalibratedMagneticField(
        field: CMMagneticField(x: 0.0, y: 0.0, z: 0.0),
        accuracy: CMMagneticFieldCalibrationAccuracy.high
    )
    
    open override var timestamp: TimeInterval {
        get {
            return _timestamp
        }
        set {
            _timestamp = newValue
        }
    }
    
    open override var attitude: CMAttitude {
        get {
            return _attitude
        }
        set {
            _attitude = newValue
        }
    }
    
    open override var rotationRate: CMRotationRate {
        get {
            return _rotationRate
        }
        set {
            _rotationRate = newValue
        }
    }
    
    open override var gravity: CMAcceleration {
        get {
            return _gravity
        }
        set {
            _gravity = newValue
        }
    }
    
    open override var userAcceleration: CMAcceleration {
        get {
            return _userAcceleration
        }
        set {
            _userAcceleration = newValue
        }
    }
    
    open override var magneticField: CMCalibratedMagneticField {
        get {
            return _magneticField
        }
        set {
            _magneticField = newValue
        }
    }
}
