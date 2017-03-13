//
//  MockCMAttitude.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

class MockCMAttitude: CMAttitude {
    private var _roll: Double = 0
    private var _yaw: Double = 0
    private var _pitch: Double = 0
    // CMRotationMatrix has initalizer that takes data such as m11 m12 m13 etc,
    // for this one it is set to all 0 as other properties
    private var _rotationMatrix: CMRotationMatrix = CMRotationMatrix()
    // CMQuaternion has initalizer that takes data such as x y z w as Double,
    // for this one it is set to all 0 as other properties
    private var _quaternion: CMQuaternion = CMQuaternion()
    
    open override var roll: Double {
        get {
            return _roll
        }
        set {
            _roll = newValue
        }
    }
    
    open override var yaw: Double {
        get {
            return _yaw
        }
        set {
            _yaw = newValue
        }
    }
    
    open override var pitch: Double {
        get {
            return _pitch
        }
        set {
            _pitch = newValue
        }
    }

    open override var rotationMatrix: CMRotationMatrix {
        get {
            return _rotationMatrix
        }
        set {
            _rotationMatrix = newValue
        }
    }

    open override var quaternion: CMQuaternion {
        get {
            return _quaternion
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

}
