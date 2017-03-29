//
//  MockCMPedometerData.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

open class MockCMPedometerData: CMPedometerData {
    private var _startDate: Date?
    private var _endDate: Date?
    private var _numberOfSteps: NSNumber?
    private var _distance: NSNumber?
    private var _floorsAscended: NSNumber?
    private var _floorsDescended: NSNumber?
    private var _currentPace: NSNumber?
    private var _currentCadence: NSNumber?
    private var _averageActivePace: NSNumber?
    
    open override var startDate: Date {
        get {
            return _startDate ?? super.startDate
        }
        set {
            _startDate = newValue
        }
    }
    
    open override var endDate: Date {
        get {
            return _endDate ?? super.endDate
        }
        set {
            _endDate = newValue
        }
    }
    
    open override var numberOfSteps: NSNumber {
        get {
            return _numberOfSteps ?? super.numberOfSteps
        }
        set {
            _numberOfSteps = newValue
        }
    }
    
    open override var distance: NSNumber? {
        get {
            return _distance
        }
        set {
            _distance = newValue
        }
    }
    
    open override var floorsAscended: NSNumber? {
        get {
            return _floorsAscended
        }
        set {
            _floorsAscended = newValue
        }
    }
    
    open override var floorsDescended: NSNumber? {
        get {
            return _floorsDescended
        }
        set {
            _floorsDescended = newValue
        }
    }
    
    open override var currentPace: NSNumber? {
        get {
            return _currentPace
        }
        set {
            _currentPace = newValue
        }
    }

    open override var currentCadence: NSNumber? {
        get {
            return _currentCadence
        }
        set {
            _currentCadence = newValue
        }
    }
    
    open override var averageActivePace: NSNumber? {
        get {
            return _averageActivePace
        }
        set {
            _averageActivePace = newValue
        }
    }
    
    public init(
        startDate: Date,
        endDate: Date,
        numberOfSteps: NSNumber,
        distance: NSNumber?,
        floorsAscended: NSNumber?,
        floorsDescended: NSNumber?,
        currentPace: NSNumber?,
        currentCadence: NSNumber?,
        averageActivePace: NSNumber?
    ) {
        _startDate = startDate
        _endDate = endDate
        _numberOfSteps = numberOfSteps
        _distance = distance
        _floorsAscended = floorsAscended
        _floorsDescended = floorsDescended
        _currentPace = currentPace
        _currentCadence = currentCadence
        _averageActivePace = averageActivePace
        super.init()
    }
    
    public required init?(coder: NSCoder) {
        if coder.containsValue(forKey: MockCMPedometerData.startDateKey),
            let startDateKeyValue = coder.decodeObject(forKey: MockCMPedometerData.startDateKey) as? Date {
            _startDate = startDateKeyValue
        }
        
        if coder.containsValue(forKey: MockCMPedometerData.endDateKey),
            let endDateKeyValue = coder.decodeObject(forKey: MockCMPedometerData.endDateKey) as? Date {
            _endDate = endDateKeyValue
        }
        
        if coder.containsValue(forKey: MockCMPedometerData.numberOfStepsKey),
            let numberOfStepsKeyValue = coder.decodeObject(forKey: MockCMPedometerData.numberOfStepsKey) as? NSNumber {
            _numberOfSteps = numberOfStepsKeyValue
        }
        
        if coder.containsValue(forKey: MockCMPedometerData.distanceKey),
            let distanceKeyValue = coder.decodeObject(forKey: MockCMPedometerData.distanceKey) as? NSNumber? {
            _distance = distanceKeyValue
        }
        
        if coder.containsValue(forKey: MockCMPedometerData.floorsAscendedKey),
            let floorsAscendedKeyValue = coder.decodeObject(forKey: MockCMPedometerData.floorsAscendedKey) as? NSNumber? {
            _floorsAscended = floorsAscendedKeyValue
        }
        
        if coder.containsValue(forKey: MockCMPedometerData.floorsDescendedKey),
            let floorsDescendedKeyValue = coder.decodeObject(forKey: MockCMPedometerData.floorsDescendedKey) as? NSNumber? {
            _floorsDescended = floorsDescendedKeyValue
        }
        
        if coder.containsValue(forKey: MockCMPedometerData.currentPaceKey),
            let currentPaceKeyValue = coder.decodeObject(forKey: MockCMPedometerData.currentPaceKey) as? NSNumber? {
            _currentPace = currentPaceKeyValue
        }
        
        if coder.containsValue(forKey: MockCMPedometerData.currentCadenceKey),
            let currentCadenceKeyValue = coder.decodeObject(forKey: MockCMPedometerData.currentCadenceKey) as? NSNumber? {
            _currentCadence = currentCadenceKeyValue
        }
        
        if coder.containsValue(forKey: MockCMPedometerData.averageActivePaceKey),
            let averageActivePaceKeyValue = coder.decodeObject(forKey: MockCMPedometerData.averageActivePaceKey) as? NSNumber? {
            _averageActivePace = averageActivePaceKeyValue
        }
        super.init(coder: coder)
    }

    private static let startDateKey =  "_startDate"
    private static let endDateKey =  "_endDate"
    private static let numberOfStepsKey = "_numberOfSteps"
    private static let distanceKey = "_distance"
    private static let floorsAscendedKey = "_floorsAscended"
    private static let floorsDescendedKey = "_floorsDescended"
    private static let currentPaceKey = "_currentPace"
    private static let currentCadenceKey = "_currentCadence"
    private static let averageActivePaceKey = "_averageActivePace"
    
    open override func encode(with coder: NSCoder) {
        coder.encode(startDate, forKey: MockCMPedometerData.startDateKey)
        coder.encode(endDate, forKey: MockCMPedometerData.endDateKey)
        coder.encode(numberOfSteps, forKey: MockCMPedometerData.numberOfStepsKey)
        coder.encode(distance, forKey: MockCMPedometerData.distanceKey)
        coder.encode(floorsAscended, forKey: MockCMPedometerData.floorsAscendedKey)
        coder.encode(floorsDescended, forKey: MockCMPedometerData.floorsDescendedKey)
        coder.encode(currentPace, forKey: MockCMPedometerData.currentPaceKey)
        coder.encode(currentCadence, forKey: MockCMPedometerData.currentCadenceKey)
        coder.encode(averageActivePace, forKey: MockCMPedometerData.averageActivePaceKey)
    }
    
}
