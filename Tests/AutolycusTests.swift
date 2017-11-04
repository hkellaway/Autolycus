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
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testLogsMessageWhenNotPreparedForAutoLayout() {
        let view1 = UIView()
        let view2 = UIView()
        var logger = FakeLogger()
        
        view1.inCenter(of: view2, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged!, AutolycusLogger.prepareForAutoLayoutMessage)
        
        logger = FakeLogger()
        view1.width(10, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged!, AutolycusLogger.prepareForAutoLayoutMessage)
        
        logger = FakeLogger()
        view1.height(10, logger: logger)
        
        logger = FakeLogger()
        view1.toSize(10, 10, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged!, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
}
