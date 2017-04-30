//
//  MockCMRecordedAccelerometerData.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

extension CMRecordedAccelerometerData: CMRecordedAccelerometerDataProtocol {}

public protocol CMRecordedAccelerometerDataProtocol {
    var identifier: UInt64 { get }
    var startDate: Date { get }
}

open class MockCMRecordedAccelerometerData: MockCMAccelerometerData, CMRecordedAccelerometerDataProtocol {
    
    private var _startDate: Date?
    private var _identifier: UInt64?
    
    open var startDate: Date {
        get {
            return _startDate!
        }
        set {
            _startDate = newValue
        }
    }
    
    open var identifier: UInt64 {
        get {
            return _identifier!
        }
        set {
            _identifier = newValue
        }
    }
    
    public init(startDate: Date, identifier: UInt64, acceleration: CMAcceleration) {
        super.init(acceleration: acceleration)
        _startDate = startDate
        _identifier = identifier
    }

    public required init?(coder: NSCoder) {
        if coder.containsValue(forKey: MockCMRecordedAccelerometerData.startDateKey),
            let startDateKeyValue = coder.decodeObject(forKey: MockCMRecordedAccelerometerData.startDateKey) as? Date {
            _startDate = startDateKeyValue
        }
        
        if coder.containsValue(forKey: MockCMRecordedAccelerometerData.identifierKey),
            let identifierKeyValue = coder.decodeObject(forKey: MockCMRecordedAccelerometerData.identifierKey) as? UInt64 {
            _identifier = identifierKeyValue
        }
        
        super.init(coder: coder)
    }
    
    private static let startDateKey = "_startDate"
    private static let identifierKey = "_identifier"
    
    open override func encode(with coder: NSCoder) {
        coder.encode(startDate, forKey: MockCMRecordedAccelerometerData.startDateKey)
        coder.encode(identifier, forKey: MockCMRecordedAccelerometerData.identifierKey)
    }
    
}
