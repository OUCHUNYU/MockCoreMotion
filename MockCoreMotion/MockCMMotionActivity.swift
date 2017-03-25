//
//  MockCMMotionActivity.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

open class MockCMMotionActivity: CMMotionActivity {
    private var _walking: Bool = false
    private var _stationary: Bool = false
    private var _running: Bool = false
    private var _automotive: Bool = false
    private var _unknown: Bool = false
    private var _cycling: Bool = false
    private var _startDate: Date = Date()
    private var _timestamp: TimeInterval = Date().timeIntervalSinceReferenceDate
    private var _confidence: CMMotionActivityConfidence = CMMotionActivityConfidence.high
    
    open override var timestamp: TimeInterval {
        get {
            return _timestamp
        }
        set {
            _timestamp = newValue
        }
    }
    
    open override var walking: Bool {
        get {
            return _walking
        }
        set {
            _walking = newValue
        }
    }
    
    open override var stationary: Bool {
        get {
            return _stationary
        }
        set {
            _stationary = newValue
        }
    }
    
    open override var running: Bool {
        get {
            return _running
        }
        set {
            _running = newValue
        }
    }
    
    open override var automotive: Bool {
        get {
            return _automotive
        }
        set {
            _automotive = newValue
        }
    }
    
    open override var unknown: Bool {
        get {
            return _unknown
        }
        set {
            _unknown = newValue
        }
    }
    
    open override var cycling: Bool {
        get {
            return _cycling
        }
        set {
            _cycling = newValue
        }
    }
    
    open override var startDate: Date {
        get {
            return _startDate
        }
        set {
            _startDate = newValue
        }
    }
    
    open override var confidence: CMMotionActivityConfidence {
        get {
            return _confidence
        }
        set {
            _confidence = newValue
        }
    }
}
