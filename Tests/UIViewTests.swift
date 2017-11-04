//
//  UIViewTests.swift
//  Autolycus
//
//  Created by Harlan Kellaway on 11/4/17.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import XCTest
@testable import Autolycus

class UIViewTests: XCTestCase {

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
        
        view.constrain().toSize(CGSize(width: 30, height: 40))
        
        XCTAssertEqual(view.widthConstraint()?.constant, 30)
        XCTAssertEqual(view.heightConstraint()?.constant, 40)
    }
    
}
