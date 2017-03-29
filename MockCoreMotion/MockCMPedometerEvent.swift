//
//  MockCMPedometerEvent.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

open class MockCMPedometerEvent: CMPedometerEvent {
    
    private var _date: Date?
    private var _type: CMPedometerEventType?
    
    open override var date: Date {
        get {
            return _date ?? super.date
        }
        set {
            _date = newValue
        }
    }
    
    open override var type: CMPedometerEventType {
        get {
            return _type ?? super.type
        }
        set {
            _type = newValue
        }
    }
    
    public init(date: Date, type: CMPedometerEventType) {
        _date = date
        _type = type
        super.init()
    }
    
    public required init?(coder: NSCoder) {
        if coder.containsValue(forKey: MockCMPedometerEvent.dateKey),
            let dateKeyValue = coder.decodeObject(forKey: MockCMPedometerEvent.dateKey) as? Date {
            _date = dateKeyValue
        }
        
        if coder.containsValue(forKey: MockCMPedometerEvent.typeKey),
            let typeKeyValue = coder.decodeObject(forKey: MockCMPedometerEvent.typeKey) as? CMPedometerEventType {
            _type = typeKeyValue
        }
        
        super.init(coder: coder)
    }
    
    private static let dateKey = "_date"
    private static let typeKey = "_type"
    
    open override func encode(with coder: NSCoder) {
        coder.encode(date, forKey: MockCMPedometerEvent.dateKey)
        coder.encode(type, forKey: MockCMPedometerEvent.typeKey)
    }
    
}
