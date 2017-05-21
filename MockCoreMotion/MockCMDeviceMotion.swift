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
    private var _attitude: CMAttitude?
    private var _rotationRate: CMRotationRate?
    private var _gravity: CMAcceleration?
    private var _userAcceleration: CMAcceleration?
    private var _magneticField: CMCalibratedMagneticField?
    
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
            return _attitude ?? super.attitude
        }
        set {
            _attitude = newValue
        }
    }
    
    open override var rotationRate: CMRotationRate {
        get {
            return _rotationRate ?? super.rotationRate
        }
        set {
            _rotationRate = newValue
        }
    }
    
    open override var gravity: CMAcceleration {
        get {
            return _gravity ?? super.gravity
        }
        set {
            _gravity = newValue
        }
    }
    
    open override var userAcceleration: CMAcceleration {
        get {
            return _userAcceleration ?? super.userAcceleration
        }
        set {
            _userAcceleration = newValue
        }
    }
    
    open override var magneticField: CMCalibratedMagneticField {
        get {
            return _magneticField ?? super.magneticField
        }
        set {
            _magneticField = newValue
        }
    }

    public init(attitude: CMAttitude, rotationRate: CMRotationRate, gravity: CMAcceleration, userAcceleration: CMAcceleration, magneticField: CMCalibratedMagneticField) {
        _attitude = attitude
        _rotationRate = rotationRate
        _gravity = gravity
        _userAcceleration = userAcceleration
        _magneticField = magneticField
        super.init()
    }
    
    public required init?(coder: NSCoder) {
        if coder.containsValue(forKey: MockCMDeviceMotion.attitudeKey),
            let attitudeValue = coder.decodeObject(forKey: MockCMDeviceMotion.attitudeKey) as? CMAttitude {
            _attitude = attitudeValue
        }
        if coder.containsValue(forKey: MockCMDeviceMotion.rotationRateKey),
            let rotationRateValue = coder.decodeObject(forKey: MockCMDeviceMotion.rotationRateKey) as? CMRotationRate {
            _rotationRate = rotationRateValue
        }
        if coder.containsValue(forKey: MockCMDeviceMotion.gravityKey),
            let gravityValue = coder.decodeObject(forKey: MockCMDeviceMotion.gravityKey) as? CMAcceleration {
            _gravity = gravityValue
        }
        if coder.containsValue(forKey: MockCMDeviceMotion.userAccelerationKey),
            let userAccelerationValue = coder.decodeObject(forKey: MockCMDeviceMotion.userAccelerationKey) as? CMAcceleration {
            _userAcceleration = userAccelerationValue
        }
        if coder.containsValue(forKey: MockCMDeviceMotion.magneticFieldKey),
            let magneticFieldValue = coder.decodeObject(forKey: MockCMDeviceMotion.magneticFieldKey) as? CMCalibratedMagneticField {
            _magneticField = magneticFieldValue
        }
        super.init(coder: coder)
    }
    
    private static let attitudeKey = "_attitude"
    private static let rotationRateKey = "_rotationRate"
    private static let gravityKey = "_gravity"
    private static let userAccelerationKey = "_userAcceleration"
    private static let magneticFieldKey = "_magneticField"
    
    open override func encode(with coder: NSCoder) {
        coder.encode(attitude, forKey: MockCMDeviceMotion.attitudeKey)
        coder.encode(rotationRate, forKey: MockCMDeviceMotion.rotationRateKey)
        coder.encode(gravity, forKey: MockCMDeviceMotion.gravityKey)
        coder.encode(userAcceleration, forKey: MockCMDeviceMotion.userAccelerationKey)
        coder.encode(magneticField, forKey: MockCMDeviceMotion.magneticFieldKey)
    }
    
    // Random MockCMDeviceMotion generator
    public static func getRandomMockCMDeviceMotion() -> MockCMDeviceMotion {
        let attitude = MockCMAttitude.getRandomMockCMAttitude()
        let rotationRate = CMRotationRate(x: drand48(), y: drand48(), z: drand48())
        let gravity = CMAcceleration(x: drand48(), y: drand48(), z: drand48())
        let userAcceleration = CMAcceleration(x: drand48(), y: drand48(), z: drand48())
        let magneticField = CMCalibratedMagneticField(field: CMMagneticField(x: drand48(), y: drand48(), z: drand48()), accuracy: CMMagneticFieldCalibrationAccuracy.high)
        return MockCMDeviceMotion(attitude: attitude, rotationRate: rotationRate, gravity: gravity, userAcceleration: userAcceleration, magneticField: magneticField)
    }
}
