//
//  MockCMAttitude.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

open class MockCMAttitude: CMAttitude {
    private var _roll: Double?
    private var _yaw: Double?
    private var _pitch: Double?
    private var _rotationMatrix: CMRotationMatrix?
    private var _quaternion: CMQuaternion?
    
    open override var roll: Double {
        get {
            return _roll ?? super.roll
        }
        set {
            _roll = newValue
        }
    }
    
    open override var yaw: Double {
        get {
            return _yaw ?? super.yaw
        }
        set {
            _yaw = newValue
        }
    }
    
    open override var pitch: Double {
        get {
            return _pitch ?? super.pitch
        }
        set {
            _pitch = newValue
        }
    }

    open override var rotationMatrix: CMRotationMatrix {
        get {
            return _rotationMatrix ?? super.rotationMatrix
        }
        set {
            _rotationMatrix = newValue
        }
    }

    open override var quaternion: CMQuaternion {
        get {
            return _quaternion ?? super.quaternion
        }
        set {
            _quaternion = newValue
        }
    }

    open override func multiply(byInverseOf attitude: CMAttitude) {
        multiplyAttitude = attitude
        multiplyCalled = true
    }

    // Instance Interface
    open var multiplyCalled = false
    open var multiplyAttitude: CMAttitude?
    
    
    public init(roll: Double, yaw: Double, pitch: Double, rotationMatrix: CMRotationMatrix, quaternion: CMQuaternion) {
        _roll = roll
        _yaw = yaw
        _pitch = pitch
        _rotationMatrix = rotationMatrix
        _quaternion = quaternion
        super.init()
    }
    
    public required init?(coder: NSCoder) {
        if coder.containsValue(forKey: MockCMAttitude.rollKey),
            let rollValue = coder.decodeObject(forKey: MockCMAttitude.rollKey) as? Double {
            _roll = rollValue
        }
        if coder.containsValue(forKey: MockCMAttitude.yawKey),
            let yawValue = coder.decodeObject(forKey: MockCMAttitude.yawKey) as? Double {
            _yaw = yawValue
        }
        if coder.containsValue(forKey: MockCMAttitude.pitchKey),
            let pitchValue = coder.decodeObject(forKey: MockCMAttitude.pitchKey) as? Double {
            _pitch = pitchValue
        }
        if coder.containsValue(forKey: MockCMAttitude.rotationMatrixKey),
            let rotationMatrixValue = coder.decodeObject(forKey: MockCMAttitude.rotationMatrixKey) as? CMRotationMatrix {
            _rotationMatrix = rotationMatrixValue
        }
        if coder.containsValue(forKey: MockCMAttitude.quaternionKey),
            let quaternionValue = coder.decodeObject(forKey: MockCMAttitude.quaternionKey) as? CMQuaternion {
            _quaternion = quaternionValue
        }
        super.init(coder: coder)
    }
    
    private static let rollKey = "_roll"
    private static let yawKey = "_yaw"
    private static let pitchKey = "_pitch"
    private static let rotationMatrixKey = "_rotationMatrix"
    private static let quaternionKey = "_quaternion"
    open override func encode(with coder: NSCoder) {
        coder.encode(roll, forKey: MockCMAttitude.rollKey)
        coder.encode(yaw, forKey: MockCMAttitude.yawKey)
        coder.encode(pitch, forKey: MockCMAttitude.pitchKey)
        coder.encode(rotationMatrix, forKey: MockCMAttitude.rotationMatrixKey)
        coder.encode(quaternion, forKey: MockCMAttitude.quaternionKey)
    }
    
    // Random MockCMAttitude generator
    public static func getRandomMockCMAttitude() -> MockCMAttitude {
        let rotationMatrix = CMRotationMatrix(m11: drand48(), m12: drand48(), m13: drand48(), m21: drand48(), m22: drand48(), m23: drand48(), m31: drand48(), m32: drand48(), m33: drand48())
        let quaternion = CMQuaternion(x: drand48(), y: drand48(), z: drand48(), w: drand48())
        return MockCMAttitude(roll: drand48(), yaw: drand48(), pitch: drand48(), rotationMatrix: rotationMatrix, quaternion: quaternion)
    }
}

















