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
    
    private var startUpdatesData: [CMPedometerData]?
    private var startUpdatesHandler: CMPedometerHandler?
    
    private var startEventUpdatesEvents: [CMPedometerEvent]?
    private var startEventUpdatesHandler: CMPedometerEventHandler?
    
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
    
    open override static func isPedometerEventTrackingAvailable() -> Bool {
        isPedometerEventTrackingAvailableCalled = true
        return _isPedometerEventTrackingAvailable ?? false
    }
    
    open override func queryPedometerData(from start: Date, to end: Date, withHandler handler: @escaping CMPedometerHandler) {
        queryPedometerDataCalled = true
        queryPedometerDataStart = start
        queryPedometerDataEnd = end
        guard queryPedometerDataHistoricalData != nil && queryPedometerDataHandlerError == nil else {
            handler(nil, queryPedometerDataHandlerError)
            return
        }
        for pedometerData in queryPedometerDataHistoricalData! {
            handler(pedometerData, nil)
        }
    }
    
    open override func startUpdates(from start: Date, withHandler handler: @escaping CMPedometerHandler) {
        startUpdatesCalled = true
        startUpdatesStart = start
        startUpdatesHandler = handler
        update(with: startUpdatesData, error: startUpdatesHandlerError)
    }
    
    open override func stopUpdates() {
        stopUpdatesCalled = true
        startUpdatesCalled = false
        startUpdatesStart = nil
        startUpdatesHandler = nil
        startUpdatesData = nil
        startUpdatesHandlerError = nil
    }
    
    open func update(with: [CMPedometerData]?, error: Error? = nil, start: Date? = nil, withHandler: CMPedometerHandler? = nil) {
        guard startUpdatesCalled else {
            return
        }
        
        startUpdatesData = with
        
        if error != nil {
            startUpdatesHandlerError = error
        }
        
        if start != nil {
            startUpdatesStart = start
        }

        if withHandler != nil {
            startUpdatesHandler = withHandler
        }
        
//        guard startUpdatesStart != nil else {
//            return
//        }
        
        guard startUpdatesHandler != nil else {
            return
        }
        
        guard startUpdatesData != nil && startUpdatesHandlerError == nil else {
            startUpdatesHandler!(nil, startUpdatesHandlerError)
            return
        }
        
        for data in startUpdatesData! {
            startUpdatesHandler!(data, nil)
        }
    }
    
    open override func startEventUpdates(handler: @escaping CMPedometerEventHandler) {
        startEventUpdatesCalled = true
        startEventUpdatesHandler = handler
        updateEvents(with: startEventUpdatesEvents, error: startEventUpdatesError)
    }
    
    open override func stopEventUpdates() {
        stopEventUpdatesCalled = true
        startEventUpdatesCalled = false
        startEventUpdatesEvents = nil
        startEventUpdatesHandler = nil
        startEventUpdatesError = nil
    }
    
    open func updateEvents(with: [CMPedometerEvent]?, error: Error? = nil, withHandler: CMPedometerEventHandler? = nil) {
        guard startEventUpdatesCalled else {
            return
        }
        
        startEventUpdatesEvents = with
        
        if error != nil {
            startEventUpdatesError = error
        }
        
        if withHandler != nil {
            startEventUpdatesHandler = withHandler
        }
        
        guard startEventUpdatesHandler != nil else {
            return
        }
        
        guard startEventUpdatesEvents != nil && startEventUpdatesError == nil else {
            startEventUpdatesHandler!(nil, startEventUpdatesError)
            return
        }
        
        for event in startEventUpdatesEvents! {
            startEventUpdatesHandler!(event, nil)
        }
    }
    
    /// Instance Interface
    open var stopUpdatesCalled = false
    open var stopEventUpdatesCalled = false
    // #queryPedometerData
    open var queryPedometerDataCalled = false
    open var queryPedometerDataStart: Date?
    open var queryPedometerDataEnd: Date?
    open var queryPedometerDataHistoricalData: [CMPedometerData]?
    open var queryPedometerDataHandlerError: Error?
    // #startUpdates
    open var startUpdatesCalled = false
    open var startUpdatesStart: Date?
    open var startUpdatesHandlerError: Error?
    // #startEventUpdates
    open var startEventUpdatesCalled = false
    open var startEventUpdatesError: Error?
    
    open func flushState() {
        // #queryPedometerData
        queryPedometerDataCalled = false
        queryPedometerDataStart = nil
        queryPedometerDataEnd = nil
        queryPedometerDataHistoricalData = nil
        queryPedometerDataHandlerError = nil
        // #startUpdates
        stopUpdates()
        // #stopUpdates
        stopUpdatesCalled = false
        // #startEventUpdates
        stopEventUpdates()
        // #stopEventUpdates
        stopEventUpdatesCalled = false
    }
    
    /// Static Interface
    open static var isStepCountingAvailableCalled = false
    open static var isDistanceAvailableCalled = false
    open static var isFloorCountingAvailableCalled = false
    open static var isPaceAvailableCalled = false
    open static var isCadenceAvailableCalled = false
    open static var isPedometerEventTrackingAvailableCalled = false

    open static var _isStepCountingAvailable: Bool?
    open static var _isDistanceAvailable: Bool?
    open static var _isFloorCountingAvailable: Bool?
    open static var _isPaceAvailable: Bool?
    open static var _isCadenceAvailable: Bool?
    open static var _isPedometerEventTrackingAvailable: Bool?
    
    open static func flushState(instance: MockCMPedometer) {
        isStepCountingAvailableCalled = false
        isDistanceAvailableCalled = false
        isFloorCountingAvailableCalled = false
        isPaceAvailableCalled = false
        isCadenceAvailableCalled = false
        isPedometerEventTrackingAvailableCalled = false

        _isStepCountingAvailable = nil
        _isDistanceAvailable = nil
        _isFloorCountingAvailable = nil
        _isPaceAvailable = nil
        _isCadenceAvailable = nil
        _isPedometerEventTrackingAvailable = nil
        instance.flushState()
    }
    
}
