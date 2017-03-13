//
//  MockCMAltimeterTests.swift
//  MockCoreMotion
//
//  Created by Chucha&Masha on 3/12/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
import CoreMotion
@testable import MockCoreMotion

class MockCMAltimeterTests: XCTestCase {
    
    var testMockCMAltimeter: MockCMAltimeter?
    class myTestError: Error {
        var _description = ""
        init(description: String) {
            _description = description
        }
        func description() -> String {
            return _description
        }
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testMockCMAltimeter = MockCMAltimeter()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        testMockCMAltimeter = nil
        super.tearDown()
    }
    
    func testIsRelativeAltitudeAvailable() {
        XCTAssertFalse(MockCMAltimeter.isRelativeAltitudeAvailable(), "isRelativeAltitudeAvailable() should return false by default.")
        MockCMAltimeter._isRelativeAltitudeAvailable = true
        XCTAssertTrue(MockCMAltimeter.isRelativeAltitudeAvailable())
    }
    
    func testStartRelativeAltitudeUpdates() {
        let defaultExpectation = expectation(description: "startRelativeAltitudeUpdates() should invoke handler callback with both params nil by default.")
        var testData: CMAltitudeData?
        var testError: Error?
        XCTAssertFalse(testMockCMAltimeter!.startRelativeAltitudeUpdatesCalled, "startRelativeAltitudeUpdates() should never be called.")
        testMockCMAltimeter?.startRelativeAltitudeUpdates(to: OperationQueue.main) {
            (data, error) in
            testData = data
            testError = error
            defaultExpectation.fulfill()
        }
        waitForExpectations(timeout: 3) {
            [unowned self](error) in
            guard error == nil else {
                XCTFail("Error found in expectation")
                return
            }
            XCTAssertNil(testData)
            XCTAssertNil(testError)
            XCTAssertTrue(self.testMockCMAltimeter!.startRelativeAltitudeUpdatesCalled, "startRelativeAltitudeUpdates() should be called.")
        }
        
        let dataExpectation = expectation(description: "startRelativeAltitudeUpdates() should invoke handler callback with custome data as params.")
        let testCMAltitudeData = CMAltitudeData()
        testMockCMAltimeter?.startRelativeAltitudeUpdatesHandlerData = testCMAltitudeData
        testMockCMAltimeter?.startRelativeAltitudeUpdates(to: OperationQueue.main) {
            (data, error) in
            testData = data
            testError = error
            dataExpectation.fulfill()
        }
        waitForExpectations(timeout: 3) {
            (error) in
            guard error == nil else {
                XCTFail("Error found in expectation")
                return
            }
            XCTAssertEqual(testData, testCMAltitudeData)
            XCTAssertNil(testError)
        }
        testMockCMAltimeter?.startRelativeAltitudeUpdatesHandlerData = nil
        let testErrorDescription = "Test Error"
        testMockCMAltimeter?.startRelativeAltitudeUpdatesHandlerError = myTestError(description: testErrorDescription)
        let errorExpectation = expectation(description: "startRelativeAltitudeUpdates() should invoke handler callback with custome error as params.")
        testMockCMAltimeter?.startRelativeAltitudeUpdates(to: OperationQueue.main) {
            (data, error) in
            testData = data
            testError = error
            errorExpectation.fulfill()
        }
        waitForExpectations(timeout: 3) {
            (error) in
            guard error == nil else {
                XCTFail("Error found in expectation")
                return
            }
            let castedError = testError as! myTestError
            XCTAssertNil(testData)
            XCTAssertEqual(castedError.description(), testErrorDescription)
        }
    }
    
    func testStopRelativeAltitudeUpdates() {
        XCTAssertFalse(testMockCMAltimeter!.stopRelativeAltitudeUpdatesCalled, "stopRelativeAltitudeUpdates() Should never be called")
        testMockCMAltimeter?.stopRelativeAltitudeUpdates()
        XCTAssertTrue(testMockCMAltimeter!.stopRelativeAltitudeUpdatesCalled, "stopRelativeAltitudeUpdates() Should be called")
    }

}
