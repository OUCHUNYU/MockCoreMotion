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
    
    // The change in altitude (in meters) since the last reported event.
    // We set default to 0 meannig we are at 0 meter
    private var _relativeAltitude: NSNumber = 0
    
    // As Altitude set to 0 and assume air temperture around 10 - 20 degree C
    // the air pressure set to default 101325.00
    private var _pressure: NSNumber = 101325.00
    
    private var _timestamp: TimeInterval = Date().timeIntervalSinceReferenceDate
    
    open override var relativeAltitude: NSNumber {
        get {
            return _relativeAltitude
        }
        set {
            _relativeAltitude = newValue
        }
    }
    
    open override var pressure: NSNumber {
        get {
            return _pressure
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

}
