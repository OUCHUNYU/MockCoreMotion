//
//  MockCMAltimeter.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion

open class MockCMAltimeter: CMAltimeter {

    open override static func isRelativeAltitudeAvailable() -> Bool {
        return _isRelativeAltitudeAvailable
    }

    open override func startRelativeAltitudeUpdates(to queue: OperationQueue, withHandler handler: @escaping CMAltitudeHandler) {
        handler(startRelativeAltitudeUpdatesHandlerData, startRelativeAltitudeUpdatesHandlerError)
        startRelativeAltitudeUpdatesCalled = true
    }

    open override func stopRelativeAltitudeUpdates() {
        stopRelativeAltitudeUpdatesCalled = true
    }

//    Static Interface
    open static var _isRelativeAltitudeAvailable = false

//    Instance Interface
    open var startRelativeAltitudeUpdatesCalled = false
    open var stopRelativeAltitudeUpdatesCalled = false

//    Customized Data
    open var startRelativeAltitudeUpdatesHandlerData: CMAltitudeData?
    open var startRelativeAltitudeUpdatesHandlerError: Error?

}
