//
//  MockCMMotionActivityManagerTests.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/26/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

// TODO: Add more failure test cases
class MockCMMotionActivityManagerTests: XCTestCase {
    
    var testMockCMMotionActivityManager: MockCMMotionActivityManager?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testMockCMMotionActivityManager = MockCMMotionActivityManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        MockCMMotionActivityManager.flushState(selfObject: testMockCMMotionActivityManager)
        super.tearDown()
    }
    
    func testIsActivityAvailable() {
        XCTAssertFalse(MockCMMotionActivityManager.isActivityAvailable())
        MockCMMotionActivityManager._isActivityAvailable = true
        XCTAssertTrue(MockCMMotionActivityManager.isActivityAvailable())
    }
    
    // TODO: testing error case
    func testQueryActivityStarting() {
        XCTAssertFalse(testMockCMMotionActivityManager!.queryActivityStartingCalled)
        XCTAssertNil(testMockCMMotionActivityManager?.queryActivityStartDate)
        XCTAssertNil(testMockCMMotionActivityManager?.queryActivityEndDate)
        XCTAssertNil(testMockCMMotionActivityManager?.queryActivityStartingHandlerError)
        XCTAssertNil(testMockCMMotionActivityManager?.historicalActivityData)
        
        let queryActivityStartingExpectation = expectation(description: "queryActivityStarting should return data")
        let testStartDate = Date() + (Date().timeIntervalSinceNow - 10000)
        let testEndDate = Date()
        let testActivityOne = MockCMMotionActivity()
        testActivityOne.walking = true
        testActivityOne.startDate = testStartDate
        let testHistoricalActivityData = [testActivityOne]
        var queryActivityStartingReturnedData: [CMMotionActivity]?
        
        testMockCMMotionActivityManager?.historicalActivityData = testHistoricalActivityData
        
        testMockCMMotionActivityManager?.queryActivityStarting(from: testStartDate, to: testEndDate, to: OperationQueue.main) {
            (data, error) in
            XCTAssertNil(error)
            queryActivityStartingReturnedData = data
            queryActivityStartingExpectation.fulfill()
            
        }
        
        XCTAssertTrue(testMockCMMotionActivityManager!.queryActivityStartingCalled)
        
        waitForExpectations(timeout: 2) {
            (error) in
            guard error == nil else {
                XCTFail("Something went wrong with expectaion")
                print("#testStartActivityUpdates error: \(error)")
                return
            }
            XCTAssertEqual(queryActivityStartingReturnedData!, testHistoricalActivityData)
        }
    }
    
    func testStartActivityUpdates() {
        let startActivityUpdatesExpectation = expectation(description: "motionActivityCollector should have 5 items")
        var motionActivityCollector = [CMMotionActivity]()
        func testHandler(_ data: CMMotionActivity?) {
            if data != nil {
                motionActivityCollector.append(data!)
            }
            if motionActivityCollector.count == 5 {
                startActivityUpdatesExpectation.fulfill()
            }
        }
        var testMotionActivities = [CMMotionActivity]()
        
        for _ in 1...5 {
            testMotionActivities.append(MockCMMotionActivity())
        }
        
        XCTAssertFalse(testMockCMMotionActivityManager!.startActivityUpdatesCalled)
        
        testMockCMMotionActivityManager?.startActivityUpdates(to: OperationQueue.main, withHandler: testHandler)
        
        XCTAssertTrue(testMockCMMotionActivityManager!.startActivityUpdatesCalled)
        
        testMockCMMotionActivityManager?.updateActivity(with: testMotionActivities)
        
        waitForExpectations(timeout: 2) {
            (error) in
            guard error == nil else {
                XCTFail("Something went wrong with expectaion")
                print("#testStartActivityUpdates error: \(error)")
                return
            }
            XCTAssertEqual(testMotionActivities.count, motionActivityCollector.count)
        }
    }
    
    func testStopActivityUpdates() {
        XCTAssertFalse(testMockCMMotionActivityManager!.stopActivityUpdatesCalled)
        testMockCMMotionActivityManager?.stopActivityUpdates()
        XCTAssertTrue(testMockCMMotionActivityManager!.stopActivityUpdatesCalled)
    }
    
}
