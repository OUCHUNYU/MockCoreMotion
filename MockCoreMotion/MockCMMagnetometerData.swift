//
//  MockCMMagnetometerData.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

open class MockCMMagnetometerData: CMMagnetometerData {
    
    private var _magneticField: CMMagneticField?
    private var _timestamp: TimeInterval = Date().timeIntervalSinceReferenceDate
    
    open override var magneticField: CMMagneticField {
        get {
            return _magneticField ?? super.magneticField
        }
        set {
            _magneticField = newValue
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
    
    public init(magneticField: CMMagneticField) {
        _magneticField = magneticField
        super.init()
    }
    
    public required init?(coder: NSCoder) {
        if coder.containsValue(forKey: MockCMMagnetometerData.magneticFieldKey),
            let magneticFieldValue = coder.decodeObject(forKey: MockCMMagnetometerData.magneticFieldKey) as? CMMagneticField {
            _magneticField = magneticFieldValue
        }
        super.init(coder: coder)
    }
    
    private static let magneticFieldKey = "_magneticField"
    
    open override func encode(with coder: NSCoder) {
        coder.encode(magneticField, forKey: MockCMMagnetometerData.magneticFieldKey)
    }
    
    // Random MockCMMagnetometerData generator
    public static func getRandomMockCMMagnetometerData() -> MockCMMagnetometerData {
        return MockCMMagnetometerData(magneticField: CMMagneticField(x: drand48(), y: drand48(), z: drand48()))
    }
}
