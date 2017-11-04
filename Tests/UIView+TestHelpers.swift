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
    
    func firstItem(constraint type: NSLayoutAttribute) -> UIView? {
        switch type {
        case .centerX:
            return centerXConstraint()?.firstItem as? UIView
        case .centerY:
            return centerYConstraint()?.firstItem as? UIView
        case .width:
            return widthConstraint()?.firstItem as? UIView
        case .height:
            return heightConstraint()?.firstItem as? UIView
        case .leading:
            return leadingConstraint()?.firstItem as? UIView
        case .trailing:
            return trailingConstraint()?.firstItem as? UIView
        case .top:
            return topConstraint()?.firstItem as? UIView
        case .bottom:
            return topConstraint()?.firstItem as? UIView
        default:
            return nil
        }
    }
    
    func secondItem(constraint type: NSLayoutAttribute) -> UIView? {
        switch type {
        case .centerX:
            return centerXConstraint()?.secondItem as? UIView
        case .centerY:
            return centerYConstraint()?.secondItem as? UIView
        case .width:
            return widthConstraint()?.secondItem as? UIView
        case .height:
            return heightConstraint()?.secondItem as? UIView
        case .leading:
            return leadingConstraint()?.secondItem as? UIView
        case .trailing:
            return trailingConstraint()?.secondItem as? UIView
        case .top:
            return topConstraint()?.secondItem as? UIView
        case .bottom:
            return bottomConstraint()?.secondItem as? UIView
        default:
            return nil
        }
    }
    
    func firstAttribute(constraint type: NSLayoutAttribute) -> NSLayoutAttribute? {
        switch type {
        case .centerX:
            return centerXConstraint()?.firstAttribute
        case .centerY:
            return centerYConstraint()?.firstAttribute
        case .width:
            return widthConstraint()?.firstAttribute
        case .height:
            return heightConstraint()?.firstAttribute
        case .leading:
            return leadingConstraint()?.firstAttribute
        case .trailing:
            return trailingConstraint()?.firstAttribute
        case .top:
            return topConstraint()?.firstAttribute
        case .bottom:
            return bottomConstraint()?.firstAttribute
        default:
            return nil
        }
    }
    
    func secondAttribute(constraint type: NSLayoutAttribute) -> NSLayoutAttribute? {
        switch type {
        case .centerX:
            return centerXConstraint()?.secondAttribute
        case .centerY:
            return centerYConstraint()?.secondAttribute
        case .width:
            return widthConstraint()?.secondAttribute
        case .height:
            return heightConstraint()?.secondAttribute
        case .leading:
            return leadingConstraint()?.secondAttribute
        case .trailing:
            return trailingConstraint()?.secondAttribute
        case .top:
            return topConstraint()?.secondAttribute
        case .bottom:
            return bottomConstraint()?.secondAttribute
        default:
            return nil
        }
    }
    
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
    
    func leadingConstraint() -> NSLayoutConstraint? {
        guard leadingConstraints().count == 1 else {
            return nil
        }
        return leadingConstraints().first
    }
    
    func trailingConstraint() -> NSLayoutConstraint? {
        guard trailingConstraints().count == 1 else {
            return nil
        }
        return trailingConstraints().first
    }
    
    func topConstraint() -> NSLayoutConstraint? {
        guard topConstraints().count == 1 else {
            return nil
        }
        return topConstraints().first
    }
    
    func bottomConstraint() -> NSLayoutConstraint? {
        guard bottomConstraints().count == 1 else {
            return nil
        }
        
        return bottomConstraints().first
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
    
    func leadingConstraints() -> [NSLayoutConstraint] {
        return constraints.filter { $0.firstAttribute == .leading }
    }
    
    func trailingConstraints() -> [NSLayoutConstraint] {
        return constraints.filter { $0.firstAttribute == .trailing }
    }
    
    func topConstraints() -> [NSLayoutConstraint] {
        return constraints.filter { $0.firstAttribute == .top }
    }
    
    func bottomConstraints() -> [NSLayoutConstraint] {
        return constraints.filter { $0.firstAttribute == .bottom }
    }
    
}
