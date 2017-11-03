//
//  AutolycusTests.swift
//  AutolycusTests
//
//  Created by Harlan Kellaway on 11/3/17.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import XCTest
@testable import Autolycus

class AutolycusTests: XCTestCase {
    
    var sut: Autolycus!
    
    override func setUp() {
        super.setUp()
        
        sut = Autolycus()
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    func testExample() {
        XCTAssertNotNil(sut)
    }
    
}
