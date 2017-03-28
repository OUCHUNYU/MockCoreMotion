//
//  MockCMPedometerDataTests.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/27/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

class MockCMPedometerDataTests: XCTestCase {
    
    var testMockCMPedometerData: MockCMPedometerData?
    
    let testStartDate = Date() + (Date().timeIntervalSinceNow - 10000)
    let testEndDate = Date()
    let testNumberOfSteps = NSNumber(value: 10)
    let testDistance = NSNumber(value: 100.123)
    let testFloorsAscended = NSNumber(value: 1)
    let testFloorsDescended = NSNumber(value: 0)
    let testCurrentPace = NSNumber(value: 3)
    let testCurrentCadence = NSNumber(value: 55)
    let testAverageActivePace = NSNumber(value: 2)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testMockCMPedometerData = MockCMPedometerData(
            startDate: testStartDate,
            endDate: testEndDate,
            numberOfSteps: testNumberOfSteps,
            distance: testDistance,
            floorsAscended: testFloorsAscended,
            floorsDescended: testFloorsDescended,
            currentPace: testCurrentPace,
            currentCadence: testCurrentCadence,
            averageActivePace: testAverageActivePace
        )
    }
    
    override func tearDown() {
        testMockCMPedometerData = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAllVariablesAreMutable() {
        XCTAssertEqual(testMockCMPedometerData!.startDate, testStartDate)
        XCTAssertEqual(testMockCMPedometerData!.endDate, testEndDate)
        XCTAssertEqual(testMockCMPedometerData!.numberOfSteps, testNumberOfSteps)
        XCTAssertEqual(testMockCMPedometerData!.distance, testDistance)
        XCTAssertEqual(testMockCMPedometerData!.floorsAscended, testFloorsAscended)
        XCTAssertEqual(testMockCMPedometerData!.floorsDescended, testFloorsDescended)
        XCTAssertEqual(testMockCMPedometerData!.currentPace, testCurrentPace)
        XCTAssertEqual(testMockCMPedometerData!.currentCadence, testCurrentCadence)
        XCTAssertEqual(testMockCMPedometerData!.averageActivePace, testAverageActivePace)

        let newStartDate = Date() + (Date().timeIntervalSinceNow - 20000)
        let newEndDate = Date()
        let newNumberOfSteps = NSNumber(value: 5)
        let newDistance = NSNumber(value: 50.123)
        let newFloorsAscended = NSNumber(value: 4)
        let newFloorsDescended = NSNumber(value: 1)
        let newCurrentPace = NSNumber(value: 5)
        let newCurrentCadence = NSNumber(value: 50)
        let newAverageActivePace = NSNumber(value: 3)

        testMockCMPedometerData?.startDate = newStartDate
        testMockCMPedometerData?.endDate = newEndDate
        testMockCMPedometerData?.numberOfSteps = newNumberOfSteps
        testMockCMPedometerData?.distance = newDistance
        testMockCMPedometerData?.floorsAscended = newFloorsAscended
        testMockCMPedometerData?.floorsDescended = newFloorsDescended
        testMockCMPedometerData?.currentPace = newCurrentPace
        testMockCMPedometerData?.currentCadence = newCurrentCadence
        testMockCMPedometerData?.averageActivePace = newAverageActivePace
        
        XCTAssertEqual(testMockCMPedometerData!.startDate, newStartDate)
        XCTAssertEqual(testMockCMPedometerData!.endDate, newEndDate)
        XCTAssertEqual(testMockCMPedometerData!.numberOfSteps, newNumberOfSteps)
        XCTAssertEqual(testMockCMPedometerData!.distance, newDistance)
        XCTAssertEqual(testMockCMPedometerData!.floorsAscended, newFloorsAscended)
        XCTAssertEqual(testMockCMPedometerData!.floorsDescended, newFloorsDescended)
        XCTAssertEqual(testMockCMPedometerData!.currentPace, newCurrentPace)
        XCTAssertEqual(testMockCMPedometerData!.currentCadence, newCurrentCadence)
        XCTAssertEqual(testMockCMPedometerData!.averageActivePace, newAverageActivePace)        
    }
    
}
