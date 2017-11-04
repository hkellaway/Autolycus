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
    
    func test_constrain_toCenter() {
        let commonAncestor = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let child = UIView()
        
        commonAncestor.addSubview(child)
        child.constrain().inCenter(of: commonAncestor)
        
        XCTAssertEqual(commonAncestor.constraints.count, 2)
        XCTAssertNotNil(commonAncestor.centerXConstraint())
        XCTAssertNotNil(commonAncestor.centerYConstraint())
    }
    
    func test_constrain_edges() {
        let commonAncestor = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let child = UIView()
        
        commonAncestor.addSubview(child)
        child.constrain().edges(to: commonAncestor)
        
        XCTAssertEqual(commonAncestor.constraints.count, 4)
        XCTAssertNotNil(commonAncestor.leadingConstraint())
        XCTAssertNotNil(commonAncestor.trailingConstraint())
        XCTAssertNotNil(commonAncestor.topConstraint())
        XCTAssertNotNil(commonAncestor.bottomConstraint())
    }
    
    func test_constrain_size_value() {
        let view = UIView()
        
        view.constrain().size(CGSize(width: 20, height: 30))
        
        XCTAssertEqual(view.widthConstraint()?.constant, 20)
        XCTAssertEqual(view.heightConstraint()?.constant, 30)
    }
    
    func test_constrain_size_toOtherView() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 123
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().size(of: commonAncestor)
        
        XCTAssertEqual((commonAncestor.widthConstraint()?.firstItem as? UIView)?.tag, child.tag)
        XCTAssertEqual(commonAncestor.widthConstraint()?.firstAttribute, .width)
        
        XCTAssertEqual((commonAncestor.heightConstraint()?.secondItem as? UIView)?.tag, commonAncestor.tag)
        XCTAssertEqual(commonAncestor.heightConstraint()?.secondAttribute, .height)
    }
    
}
