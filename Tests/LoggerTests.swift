//
//  LoggerTests.swift
//  Autolycus
//
//  Created by Harlan Kellaway on 11/4/17.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import XCTest
@testable import Autolycus

class LoggerTests: XCTestCase {
    
    func testLogger_logsMessage_whenCannotConstrain_inCenter() {
        let view1 = UIView()
        let view2 = UIView()
        let logger = FakeLogger()
        
        view1.inCenter(of: view2, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
    func testLogger_logsMessage_whenCannotConstrain_edges() {
        let view1 = UIView()
        let view2 = UIView()
        let logger = FakeLogger()
        
        view1.edges(to: view2, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
    func testLogger_logsMessage_whenCannotConstrain_Size() {
        let view = UIView()
        let logger = FakeLogger()
        
        view.toSize(10, 10, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
    func testLogger_logsMessage_whenCannotConstrain_Width() {
        let view = UIView()
        let logger = FakeLogger()
        
        view.width(10, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
    func testLogger_logsMessage_whenCannotConstrain_Height() {
        let view = UIView()
        let logger = FakeLogger()
        
        view.height(10, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
}
