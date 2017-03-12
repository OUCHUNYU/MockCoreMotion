//
//  MockCMAltimeterTests.swift
//  MockCoreMotion
//
//  Created by Chucha&Masha on 3/12/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import XCTest
@testable import MockCoreMotion

class MockCMAltimeterTests: XCTestCase {
    
    var testMockCMAltimeter: MockCMAltimeter?
    
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
    
}
