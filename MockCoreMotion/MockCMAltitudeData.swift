//
//  MockCMAltitudeData.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

open class MockCMAltitudeData: CMAltitudeData {
    
    private var _relativeAltitude: NSNumber?
    
    private var _pressure: NSNumber?
    
    private var _timestamp: TimeInterval = Date().timeIntervalSinceReferenceDate
    
    open override var relativeAltitude: NSNumber {
        get {
            return _relativeAltitude ?? super.relativeAltitude
        }
        set {
            _relativeAltitude = newValue
        }
    }
    
    open override var pressure: NSNumber {
        get {
            return _pressure ?? super.pressure
        }
        set {
            _pressure = newValue
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
    
    public init(relativeAltitude: NSNumber, pressure: NSNumber) {
        _relativeAltitude = relativeAltitude
        _pressure = pressure
        super.init()
    }
    
    public required init?(coder: NSCoder) {
        if coder.containsValue(forKey: MockCMAltitudeData.relativeAltitudeKey),
            let relativeAltitudeValue = coder.decodeObject(forKey: MockCMAltitudeData.relativeAltitudeKey) as? NSNumber {
            _relativeAltitude = relativeAltitudeValue
        }
        if coder.containsValue(forKey: MockCMAltitudeData.pressureKey),
            let pressureValue = coder.decodeObject(forKey: MockCMAltitudeData.pressureKey) as? NSNumber {
            _pressure = pressureValue
        }
        super.init(coder: coder)
    }
    
    private static let relativeAltitudeKey = "_relativeAltitude"
    private static let pressureKey = "_pressure"
    open override func encode(with coder: NSCoder) {
        coder.encode(relativeAltitude, forKey: MockCMAltitudeData.relativeAltitudeKey)
        coder.encode(pressure, forKey: MockCMAltitudeData.pressureKey)
    }
    
    // Random MockCMAltitudeData generator
    public static func getRandomMockCMAltitudeData() -> MockCMAltitudeData {
        return MockCMAltitudeData(relativeAltitude: NSNumber(value: arc4random_uniform(10000000)), pressure: NSNumber(value: arc4random_uniform(10000000)))
    }

}
