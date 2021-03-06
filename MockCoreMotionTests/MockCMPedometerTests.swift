//
//  MockCMPedometerTests.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/26/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

class MockCMPedometerTests: XCTestCase {
    
    var testMockCMPedometer: MockCMPedometer?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testMockCMPedometer = MockCMPedometer()
    }
    
    override func tearDown() {
        MockCMPedometer.flushState(instance: testMockCMPedometer!)
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStaticAvailabilityFunctions() {
        XCTAssertFalse(MockCMPedometer.isStepCountingAvailableCalled)
        XCTAssertFalse(MockCMPedometer.isDistanceAvailableCalled)
        XCTAssertFalse(MockCMPedometer.isFloorCountingAvailableCalled)
        XCTAssertFalse(MockCMPedometer.isPaceAvailableCalled)
        XCTAssertFalse(MockCMPedometer.isCadenceAvailableCalled)
        XCTAssertFalse(MockCMPedometer.isPedometerEventTrackingAvailableCalled)
        
        XCTAssertFalse(MockCMPedometer.isStepCountingAvailable())
        XCTAssertFalse(MockCMPedometer.isDistanceAvailable())
        XCTAssertFalse(MockCMPedometer.isFloorCountingAvailable())
        XCTAssertFalse(MockCMPedometer.isPaceAvailable())
        XCTAssertFalse(MockCMPedometer.isCadenceAvailable())
        XCTAssertFalse(MockCMPedometer.isPedometerEventTrackingAvailable())
        
        MockCMPedometer._isStepCountingAvailable = true
        MockCMPedometer._isDistanceAvailable = true
        MockCMPedometer._isFloorCountingAvailable = true
        MockCMPedometer._isPaceAvailable = true
        MockCMPedometer._isCadenceAvailable = true
        MockCMPedometer._isPedometerEventTrackingAvailable = true

        XCTAssertTrue(MockCMPedometer.isStepCountingAvailableCalled)
        XCTAssertTrue(MockCMPedometer.isDistanceAvailableCalled)
        XCTAssertTrue(MockCMPedometer.isFloorCountingAvailableCalled)
        XCTAssertTrue(MockCMPedometer.isPaceAvailableCalled)
        XCTAssertTrue(MockCMPedometer.isCadenceAvailableCalled)
        XCTAssertTrue(MockCMPedometer.isPedometerEventTrackingAvailableCalled)
        
        XCTAssertTrue(MockCMPedometer.isStepCountingAvailable())
        XCTAssertTrue(MockCMPedometer.isDistanceAvailable())
        XCTAssertTrue(MockCMPedometer.isFloorCountingAvailable())
        XCTAssertTrue(MockCMPedometer.isPaceAvailable())
        XCTAssertTrue(MockCMPedometer.isCadenceAvailable())
        XCTAssertTrue(MockCMPedometer.isPedometerEventTrackingAvailable())
    }
    
    // TODO: Handler error test
    func testQueryPedometerData() {
        var testPedometerDataCollector = [CMPedometerData]()
        
        XCTAssertFalse(testMockCMPedometer!.queryPedometerDataCalled)
        XCTAssertNil(testMockCMPedometer?.queryPedometerDataStart)
        XCTAssertNil(testMockCMPedometer?.queryPedometerDataEnd)
        XCTAssertNil(testMockCMPedometer?.queryPedometerDataHistoricalData)
        XCTAssertNil(testMockCMPedometer?.queryPedometerDataHandlerError)
        
        let testStart = Date() + (Date().timeIntervalSinceNow - 10000)
        let testEnd = Date()
        var testPedometerData = [CMPedometerData]()
        for _ in 1...5 {
            testPedometerData.append(CMPedometerData())
        }
        testMockCMPedometer?.queryPedometerDataHistoricalData = testPedometerData
        
        testMockCMPedometer?.queryPedometerData(from: testStart, to: testEnd) {
            (data, error) in
            XCTAssertNil(error)
            testPedometerDataCollector.append(data!)
        }
        XCTAssertEqual(testPedometerDataCollector.count, testPedometerData.count)
        XCTAssertTrue(testMockCMPedometer!.queryPedometerDataCalled)
        XCTAssertEqual(testMockCMPedometer!.queryPedometerDataStart, testStart)
        XCTAssertEqual(testMockCMPedometer!.queryPedometerDataEnd, testEnd)
    }
    
    // TODO: Handler error test
    func testStartUpdates() {
        XCTAssertFalse(testMockCMPedometer!.startUpdatesCalled)
        XCTAssertNil(testMockCMPedometer?.startUpdatesStart)
        
        let testStart = Date()
        testMockCMPedometer!.startUpdates(from: testStart) {
            [unowned self] (data, error) in
            XCTAssertEqual(self.testMockCMPedometer!.startUpdatesStart, testStart)
            XCTAssertTrue(self.testMockCMPedometer!.startUpdatesCalled)
            XCTAssertNil(data)
            XCTAssertNil(error)
        }
    }
    
    func testStopUpdates() {
        XCTAssertFalse(testMockCMPedometer!.stopUpdatesCalled)
        testMockCMPedometer?.stopUpdates()
        XCTAssertTrue(testMockCMPedometer!.stopUpdatesCalled)
    }
    
    // TODO: Handler error test
    func testUpdate() {
        var isHandlerCalled = false
        var testPedometerDataCollector = [CMPedometerData]()
        let testStart = Date()
        var testPedometerData = [CMPedometerData]()
        for _ in 1...5 {
            testPedometerData.append(CMPedometerData())
        }
        func updateHandler(data: CMPedometerData?, error: Error?) {
            guard data != nil else {
                return
            }
            testPedometerDataCollector.append(data!)
        }
        
        testMockCMPedometer?.update(with: testPedometerData) {
            (data, error) in
            isHandlerCalled = true
        }
        XCTAssertFalse(isHandlerCalled, "If startUpdates is never called before, then update should not call the handler")
        
        testMockCMPedometer?.startUpdates(from: testStart, withHandler: updateHandler)
        
        XCTAssertEqual(testPedometerDataCollector.count, 0, "Calling startUpdates should not have update")
        
        testMockCMPedometer?.update(with: testPedometerData)
        XCTAssertEqual(testPedometerDataCollector.count, testPedometerData.count)
    }
    
    // TODO: Handler error test
    func testStartEventUpdates() {
        XCTAssertFalse(testMockCMPedometer!.startEventUpdatesCalled)
        XCTAssertNil(testMockCMPedometer?.startEventUpdatesError)
        
        testMockCMPedometer!.startEventUpdates() {
            [unowned self] (data, error) in
            XCTAssertTrue(self.testMockCMPedometer!.startEventUpdatesCalled)
            XCTAssertNil(data)
            XCTAssertNil(error)
        }
    }
    
    func testStopEventUpdates() {
        XCTAssertFalse(testMockCMPedometer!.stopEventUpdatesCalled)
        testMockCMPedometer?.stopEventUpdates()
        XCTAssertTrue(testMockCMPedometer!.stopEventUpdatesCalled)
    }
    
    // TODO: Handler error test
    func testUpdateEvents() {
        var isHandlerCalled = false
        var testPedometerEventCollector = [CMPedometerEvent]()
        var testPedometerEvents = [CMPedometerEvent]()
        for _ in 1...5 {
            testPedometerEvents.append(CMPedometerEvent())
        }
        func updateEventsHandler(data: CMPedometerEvent?, error: Error?) {
            guard data != nil else {
                return
            }
            testPedometerEventCollector.append(data!)
        }
        
        testMockCMPedometer?.updateEvents(with: testPedometerEvents) {
            (data, error) in
            isHandlerCalled = true
        }
        
        XCTAssertFalse(isHandlerCalled, "If startEventUpdates is never called before, then updateEvents should not call the handler")
        
        testMockCMPedometer?.startEventUpdates(handler: updateEventsHandler)
        
        XCTAssertEqual(testPedometerEventCollector.count, 0, "Calling startEventUpdates should not have update")
        
        testMockCMPedometer?.updateEvents(with: testPedometerEvents)
        
        XCTAssertEqual(testPedometerEventCollector.count, testPedometerEvents.count)
    }
    
}
