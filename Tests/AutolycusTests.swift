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
    
    func testConstrainWidth() {
        let view = UIView()
        
        view.constrain().toWidth(10)
        
        XCTAssertEqual(view.widthConstraint()?.constant, 10)
    }
    
    func testConstraintHeight() {
        let view = UIView()
        
        view.constrain().toHeight(20)
        
        XCTAssertEqual(view.heightConstraint()?.constant, 20)
    }
    
    func testConstrainSize() {
        let view = UIView()
        
        view.constrain().toSize(30, 40)
        
        XCTAssertEqual(view.widthConstraint()?.constant, 30)
        XCTAssertEqual(view.heightConstraint()?.constant, 40)
    }
    
    func testConstrainToCenter() {
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let view2 = UIView()
        
        view1.addSubview(view2)
        view2.constrain().toSize(10, 10).inCenter(of: view1)
        
        XCTAssertEqual(view1.constraints.count, 2)
        XCTAssertNotNil(view1.centerXConstraint())
        XCTAssertNotNil(view1.centerYConstraint())
    }
    
}
