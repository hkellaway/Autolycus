//
//  UIView+TestHelpers.swift
//  Autolycus
//
//  Created by Harlan Kellaway on 11/3/17.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import XCTest
import UIKit
@testable import Autolycus

extension UIView {
    
    func centerXConstraint() -> NSLayoutConstraint? {
        guard centerXConstraints().count == 1 else {
            return nil
        }
        return centerXConstraints().first
    }
    
    func centerYConstraint() -> NSLayoutConstraint? {
        guard centerYConstraints().count == 1 else {
            return nil
        }
        return centerYConstraints().first
    }
    
    func widthConstraint() -> NSLayoutConstraint? {
        guard widthConstraints().count == 1 else {
            return nil
        }
        return widthConstraints().first
    }
    
    func heightConstraint() -> NSLayoutConstraint? {
        guard heightConstraints().count == 1 else {
            return nil
        }
        return heightConstraints().first
    }
    
    func widthConstraints() -> [NSLayoutConstraint] {
        return constraints.filter { $0.firstAttribute == .width }
    }
    
    func heightConstraints() -> [NSLayoutConstraint] {
        return constraints.filter { $0.firstAttribute == .height }
    }
    
    func centerXConstraints() -> [NSLayoutConstraint] {
        return constraints.filter { $0.firstAttribute == .centerX }
    }
    
    func centerYConstraints() -> [NSLayoutConstraint] {
        return constraints.filter { $0.firstAttribute == .centerY }
    }
    
}
