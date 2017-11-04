//
//  ConstraintTests.swift
//  AutolycusTests
//
//  Created by Harlan Kellaway on 11/3/17.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import XCTest
@testable import Autolycus

class ConstraintTests: XCTestCase {
    
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
        let commonAncestor = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let child = UIView()
        
        commonAncestor.addSubview(child)
        child.constrain().inCenter(of: commonAncestor)
        
        XCTAssertEqual(commonAncestor.constraints.count, 2)
        XCTAssertNotNil(commonAncestor.centerXConstraint())
        XCTAssertNotNil(commonAncestor.centerYConstraint())
    }
    
    func testConstrainEdges() {
        let commonAncestor = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let child = UIView()
        
        commonAncestor.addSubview(child)
        child.constrain().edges(to: commonAncestor)
        
        print(commonAncestor.constraints)
        
        XCTAssertEqual(commonAncestor.constraints.count, 4)
        XCTAssertNotNil(commonAncestor.leadingConstraint())
        XCTAssertNotNil(commonAncestor.trailingConstraint())
        XCTAssertNotNil(commonAncestor.topConstraint())
        XCTAssertNotNil(commonAncestor.bottomConstraint())
    }
    
}
