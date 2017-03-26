//
//  MockCMPedometer.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

open class MockCMPedometer: CMPedometer {
    
    private var queryPedometerDataHandler: CMPedometerHandler?
    private var queryPedometerDataHistoricalData: [CMPedometerData]?
    
    open override static func isStepCountingAvailable() -> Bool {
        isStepCountingAvailableCalled = true
        return _isStepCountingAvailable ?? false
    }
    
    open override static func isDistanceAvailable() -> Bool {
        isDistanceAvailableCalled = true
        return _isDistanceAvailable ?? false
    }
    
    open override static func isFloorCountingAvailable() -> Bool {
        isFloorCountingAvailableCalled = true
        return _isFloorCountingAvailable ?? false
    }
    
    open override static func isPaceAvailable() -> Bool {
        isPaceAvailableCalled = true
        return _isPaceAvailable ?? false
    }
    
    open override static func isCadenceAvailable() -> Bool {
        isCadenceAvailableCalled = true
        return _isCadenceAvailable ?? false
    }
    
    open override func queryPedometerData(from start: Date, to end: Date, withHandler handler: @escaping CMPedometerHandler) {
        queryPedometerDataCalled = true
        queryPedometerDataStart = start
        queryPedometerDataEnd = end
        queryPedometerDataHandler = handler
    }
    
    open override func startUpdates(from start: Date, withHandler handler: @escaping CMPedometerHandler) {
        startUpdatesCalled = true
    }
    
    open override func stopUpdates() {
        stopUpdatesCalled = true
    }
    
    open override func startEventUpdates(handler: @escaping CMPedometerEventHandler) {
        startEventUpdatesCalled = true
    }
    
    open override func stopEventUpdates() {
        stopEventUpdatesCalled = true
    }
    
    /// Instance Interface
    open var queryPedometerDataCalled = false
    open var startUpdatesCalled = false
    open var stopUpdatesCalled = false
    open var startEventUpdatesCalled = false
    open var stopEventUpdatesCalled = false
    
    open var queryPedometerDataStart: Date?
    open var queryPedometerDataEnd: Date?
    
    open func flushState() {
        queryPedometerDataCalled = false
        startUpdatesCalled = false
        stopUpdatesCalled = false
        startEventUpdatesCalled = false
        stopEventUpdatesCalled = false
        
        // #queryPedometerData
        queryPedometerDataStart = nil
        queryPedometerDataEnd = nil
        queryPedometerDataHandler = nil
        queryPedometerDataHistoricalData = nil
        
        // #startUpdates
        
        // #stopUpdates
        
        // #startEventUpdates
        
        // #stopEventUpdates

    }
    
    /// Static Interface
    open static var isStepCountingAvailableCalled = false
    open static var isDistanceAvailableCalled = false
    open static var isFloorCountingAvailableCalled = false
    open static var isPaceAvailableCalled = false
    open static var isCadenceAvailableCalled = false

    open static var _isStepCountingAvailable: Bool?
    open static var _isDistanceAvailable: Bool?
    open static var _isFloorCountingAvailable: Bool?
    open static var _isPaceAvailable: Bool?
    open static var _isCadenceAvailable: Bool?
    
    open static func flushState(instance: MockCMPedometer) {
        isStepCountingAvailableCalled = false
        isDistanceAvailableCalled = false
        isFloorCountingAvailableCalled = false
        isPaceAvailableCalled = false
        isCadenceAvailableCalled = false

        _isStepCountingAvailable = nil
        _isDistanceAvailable = nil
        _isFloorCountingAvailable = nil
        _isPaceAvailable = nil
        _isCadenceAvailable = nil
        instance.flushState()
    }
    
}
