//
//  MockCMLogItem.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

class MockCMLogItem: CMLogItem {
    open var _timestamp: TimeInterval?
    
    public init(timestamp: TimeInterval) {
        _timestamp = timestamp
        super.init()
    }
    
    open override var timestamp: TimeInterval {
        get {
            return _timestamp ?? super.timestamp
        }
        set {
            _timestamp = newValue
        }
    }
    
    public required init?(coder: NSCoder) {
        if coder.containsValue(forKey: MockCMLogItem.timestampKey),
            let timestampValue = coder.decodeObject(forKey: MockCMLogItem.timestampKey) as? TimeInterval {
            _timestamp = timestampValue
        }
        super.init(coder: coder)
    }
    
    private static let timestampKey = "_timestamp"
    open override func encode(with coder: NSCoder) {
        coder.encode(timestamp, forKey: MockCMLogItem.timestampKey)
    }
}
