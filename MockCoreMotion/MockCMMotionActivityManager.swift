//
//  MockCMMotionActivityManager.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

open class MockCMMotionActivityManager: CMMotionActivityManager {
    private var activityData: [CMMotionActivity]?
    private var activityQueue: OperationQueue?
    private var activityUpdateHandler: CMMotionActivityHandler?
    
    open override static func isActivityAvailable() -> Bool {
        isActivityAvailableCalled = true
        return _isActivityAvailable ?? false
    }
    
    // TODO: Improve this method, currently it you need to pre-assign what data it will return upon calling
    // The start time and end time params don't do anything. We can make it constructing an array of
    // historical activity data with start and end time params and return.
    open override func queryActivityStarting(
        from start: Date,
        to end: Date,
        to queue: OperationQueue,
        withHandler handler: @escaping CoreMotion.CMMotionActivityQueryHandler
    ) {
        queryActivityStartingCalled = true
        queryActivityStartDate = start
        queryActivityEndDate = end
        activityQueue = queue
        queue.addOperation { [unowned self] in
            handler(self.historicalActivityData, self.queryActivityStartingHandlerError)
        }
    }
    
    open override func startActivityUpdates(
        to queue: OperationQueue,
        withHandler handler: @escaping CMMotionActivityHandler
    ) {
        startActivityUpdatesCalled = true
        activityQueue = queue
        activityUpdateHandler = handler
        guard activityData != nil else {
            return
        }
        queue.addOperation { [unowned self] in
            for activityObject in self.activityData! {
                handler(activityObject)
            }
        }
    }
    
    open override func stopActivityUpdates() {
        stopActivityUpdatesCalled = true
    }
    
    /// Instance Interface
    open var queryActivityStartingCalled = false
    open var queryActivityStartDate: Date?
    open var queryActivityEndDate: Date?
    open var startActivityUpdatesCalled = false
    open var stopActivityUpdatesCalled = false
    
    open var historicalActivityData: [CMMotionActivity]?
    open var queryActivityStartingHandlerError: Error?
    
    open func updateActivity(with: [CMMotionActivity]?, onQueue: OperationQueue? = nil, withHandler: CMMotionActivityHandler? = nil) {
        activityData = with
        
        if onQueue != nil {
            activityQueue = onQueue
        }
        
        if withHandler != nil {
            activityUpdateHandler = withHandler
        }
        
        guard activityQueue != nil else {
            return
        }
        
        guard activityUpdateHandler != nil else {
            return
        }
        
        startActivityUpdates(to: activityQueue!, withHandler: activityUpdateHandler!)
    }
    
    // flushState only on instance properties
    open func flushState() {
        queryActivityStartingCalled = false
        queryActivityStartDate = nil
        queryActivityEndDate = nil
        startActivityUpdatesCalled = false
        stopActivityUpdatesCalled = false
        historicalActivityData = nil
        queryActivityStartingHandlerError = nil
        activityData = nil
        activityQueue = nil
        activityUpdateHandler = nil
    }
    
    /// Static Interface
    open static var _isActivityAvailable: Bool?
    open static var isActivityAvailableCalled = false
    
    // By passing in the instance you want to flushState you flush the state of both static and instance properties
    open static func flushState(selfObject: MockCMMotionActivityManager?) {
        _isActivityAvailable = nil
        isActivityAvailableCalled = false
        selfObject?.flushState()
    }
}
