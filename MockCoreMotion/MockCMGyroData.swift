//
//  MockCMGyroData.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

open class MockCMGyroData: CMGyroData {
    private var _rotationRate: CMRotationRate?
    private var _timestamp: TimeInterval = Date().timeIntervalSinceReferenceDate
    
    open override var rotationRate: CMRotationRate {
        get {
            return _rotationRate ?? super.rotationRate
        }
        set {
            _rotationRate = newValue
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
    
    public init(rotationRate: CMRotationRate) {
        _rotationRate = rotationRate
        super.init()
    }
    
    public required init?(coder: NSCoder) {
        if coder.containsValue(forKey: MockCMGyroData.rotationRateKey),
            let rotationRateValue = coder.decodeObject(forKey: MockCMGyroData.rotationRateKey) as? CMRotationRate {
            _rotationRate = rotationRateValue
        }
        super.init(coder: coder)
    }
    
    private static let rotationRateKey = "_rotationRate"
    
    open override func encode(with coder: NSCoder) {
        coder.encode(rotationRate, forKey: MockCMGyroData.rotationRateKey)
    }
}
