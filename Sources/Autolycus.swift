//
//  Autolycus.swift
//
//  UIView+Autolycus.swift
//  Autolycus
//
// Copyright (c) 2020 Harlan Kellaway
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import UIKit

public protocol Constrainable: class {
    var parent: UIView { get }
    var target: UIView { get }
}

public enum ConstraintRelation {
    case equal
    case equalOrLess
    case equalOrGreater
}

extension Constrainable {

    @discardableResult
    public func add(to parent: UIView) -> Self {
        target.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(target)

        return self
    }
}

extension Constrainable {

    @discardableResult
    public func addTopConstraint<YAxis>(
        to anchor: KeyPath<UIView, YAxis>,
        of view: UIView? = nil,
        relation: ConstraintRelation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint where YAxis: NSLayoutYAxisAnchor {
        return target.topAnchor
            .constraint(to: (view ?? parent)[keyPath: anchor], relation: relation)
            .offset(constant)
            .priority(priority)
            .activate()
    }

    @discardableResult
    public func top<YAxis>(
        to anchor: KeyPath<UIView, YAxis>,
        of view: UIView? = nil,
        relation: ConstraintRelation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> Self where YAxis: NSLayoutYAxisAnchor {
        addTopConstraint(to: anchor, of: view, relation: relation, constant: constant, priority: priority)
        return self
    }

    @discardableResult
    public func addBottomConstraint<YAxis>(
        to anchor: KeyPath<UIView, YAxis>,
        of view: UIView? = nil,
        relation: ConstraintRelation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint where YAxis: NSLayoutYAxisAnchor {
        return target.bottomAnchor
            .constraint(to: (view ?? parent)[keyPath: anchor], relation: relation)
            .offset(-constant)
            .priority(priority)
            .activate()
    }

    @discardableResult
    public func bottom<YAxis>(
        to anchor: KeyPath<UIView, YAxis>,
        of view: UIView? = nil,
        relation: ConstraintRelation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> Self where YAxis: NSLayoutYAxisAnchor {
        addBottomConstraint(to: anchor, of: view, relation: relation, constant: constant, priority: priority)
        return self
    }

    @discardableResult
    public func addCenterYConstraint<YAxis>(
        to anchor: KeyPath<UIView, YAxis>,
        of view: UIView? = nil,
        relation: ConstraintRelation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint where YAxis: NSLayoutYAxisAnchor {
        return target.centerYAnchor
            .constraint(to: (view ?? parent)[keyPath: anchor], relation: relation)
            .offset(constant)
            .priority(priority)
            .activate()
    }

    @discardableResult
    public func centerY<YAxis>(
        to anchor: KeyPath<UIView, YAxis>,
        of view: UIView? = nil,
        relation: ConstraintRelation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> Self where YAxis: NSLayoutYAxisAnchor {
        addCenterYConstraint(to: anchor, of: view, relation: relation, constant: constant, priority: priority)
        return self
    }
}

extension Constrainable {

    @discardableResult
    public func addLeftConstraint<XAxis>(
        to anchor: KeyPath<UIView, XAxis>,
        of view: UIView? = nil,
        relation: ConstraintRelation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint where XAxis: NSLayoutXAxisAnchor {
        return target.leftAnchor
            .constraint(to: (view ?? parent)[keyPath: anchor], relation: relation)
            .offset(constant)
            .priority(priority)
            .activate()
    }

    @discardableResult
    public func left<XAxis>(
        to anchor: KeyPath<UIView, XAxis>,
        of view: UIView? = nil,
        relation: ConstraintRelation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> Self where XAxis: NSLayoutXAxisAnchor {
        addLeftConstraint(to: anchor, of: view, relation: relation, constant: constant, priority: priority)
        return self
    }

    @discardableResult
    public func addRightConstraint<XAxis>(
        to anchor: KeyPath<UIView, XAxis>,
        of view: UIView? = nil,
        relation: ConstraintRelation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint where XAxis: NSLayoutXAxisAnchor {
        return target.rightAnchor
            .constraint(to: (view ?? parent)[keyPath: anchor], relation: relation)
            .offset(-constant)
            .priority(priority)
            .activate()
    }

    @discardableResult
    public func right<XAxis>(
        to anchor: KeyPath<UIView, XAxis>,
        of view: UIView? = nil,
        relation: ConstraintRelation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> Self where XAxis: NSLayoutXAxisAnchor {
        addRightConstraint(to: anchor, of: view, relation: relation, constant: constant, priority: priority)
        return self
    }

    @discardableResult
    public func addLeadingConstraint<XAxis>(
        to anchor: KeyPath<UIView, XAxis>,
        of view: UIView? = nil,
        relation: ConstraintRelation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint where XAxis: NSLayoutXAxisAnchor {
        return target.leadingAnchor
            .constraint(to: (view ?? parent)[keyPath: anchor], relation: relation)
            .offset(constant)
            .priority(priority)
            .activate()
    }

    @discardableResult
    public func leading<XAxis>(
        to anchor: KeyPath<UIView, XAxis>,
        of view: UIView? = nil,
        relation: ConstraintRelation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> Self where XAxis: NSLayoutXAxisAnchor {
        addLeadingConstraint(to: anchor, of: view, relation: relation, constant: constant, priority: priority)
        return self
    }

    @discardableResult
    public func addTrailingConstraint<XAxis>(
        to anchor: KeyPath<UIView, XAxis>,
        of view: UIView? = nil,
        relation: ConstraintRelation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint where XAxis: NSLayoutXAxisAnchor {
        return target.trailingAnchor
            .constraint(to: (view ?? parent)[keyPath: anchor], relation: relation)
            .offset(-constant)
            .priority(priority)
            .activate()
    }

    @discardableResult
    public func trailing<XAxis>(
        to anchor: KeyPath<UIView, XAxis>,
        of view: UIView? = nil,
        relation: ConstraintRelation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> Self where XAxis: NSLayoutXAxisAnchor {
        addTrailingConstraint(to: anchor, of: view, relation: relation, constant: constant, priority: priority)
        return self
    }

    @discardableResult
    public func addCenterXConstraint<XAxis>(
        to anchor: KeyPath<UIView, XAxis>,
        of view: UIView? = nil,
        relation: ConstraintRelation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint where XAxis: NSLayoutXAxisAnchor {
        return target.centerXAnchor
            .constraint(to: (view ?? parent)[keyPath: anchor], relation: relation)
            .offset(constant)
            .priority(priority)
            .activate()
    }

    @discardableResult
    public func centerX<XAxis>(
        to anchor: KeyPath<UIView, XAxis>,
        of view: UIView? = nil,
        relation: ConstraintRelation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> Self where XAxis: NSLayoutXAxisAnchor {
        addCenterXConstraint(to: anchor, of: view, relation: relation, constant: constant, priority: priority)
        return self
    }
}

extension Constrainable {

    @discardableResult
    public func addWidth(
        _ constant: CGFloat,
        relation: ConstraintRelation = .equal,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {
        return target.widthAnchor
            .constraint(toConstant: constant, relation: relation)
            .priority(priority)
            .activate()
    }

    @discardableResult
    public func width(
        _ constant: CGFloat,
        relation: ConstraintRelation = .equal,
        priority: UILayoutPriority = .required
        ) -> Self {
        addWidth(constant, relation: relation, priority: priority)
        return self
    }

    @discardableResult
    public func addWidth<XAxis>(
        to dimension: KeyPath<UIView, XAxis>,
        of view: UIView? = nil,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0,
        relation: ConstraintRelation = .equal,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint where XAxis: NSLayoutDimension {
        return target.widthAnchor
            .constraint(to: (view ?? parent)[keyPath: dimension], multiplier: multiplier, relation: relation)
            .offset(constant)
            .priority(priority)
            .activate()
    }

    @discardableResult
    public func width<XAxis>(
        to dimension: KeyPath<UIView, XAxis>,
        of view: UIView? = nil,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0,
        relation: ConstraintRelation = .equal,
        priority: UILayoutPriority = .required
        ) -> Self where XAxis: NSLayoutDimension {
        addWidth(to: dimension, of: view, multiplier: multiplier, constant: constant, relation: relation, priority: priority)
        return self
    }

    @discardableResult
    public func addHeight(
        _ constant: CGFloat,
        relation: ConstraintRelation = .equal,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {
        return target.heightAnchor
            .constraint(toConstant: constant, relation: relation)
            .priority(priority)
            .activate()
    }

    @discardableResult
    public func height(
        _ constant: CGFloat,
        relation: ConstraintRelation = .equal,
        priority: UILayoutPriority = .required
        ) -> Self {
        addHeight(constant, relation: relation, priority: priority)
        return self
    }

    @discardableResult
    public func addHeight<YAxis>(
        to dimension: KeyPath<UIView, YAxis>,
        of view: UIView? = nil,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0,
        relation: ConstraintRelation = .equal,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint where YAxis: NSLayoutDimension {
        return target.heightAnchor
            .constraint(to: (view ?? parent)[keyPath: dimension], multiplier: multiplier, relation: relation)
            .offset(constant)
            .priority(priority)
            .activate()
    }

    @discardableResult
    public func height<YAxis>(
        to dimension: KeyPath<UIView, YAxis>,
        of view: UIView? = nil,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0,
        relation: ConstraintRelation = .equal,
        priority: UILayoutPriority = .required
        ) -> Self where YAxis: NSLayoutDimension {
        addHeight(to: dimension, of: view, multiplier: multiplier, constant: constant, relation: relation, priority: priority)
        return self
    }
}

extension UIView: Constrainable {
    public var parent: UIView {
        guard let parent = superview else { fatalError("The view has no superview") }
        return parent
    }

    public var target: UIView {
        return self
    }
}

extension NSLayoutXAxisAnchor {

    internal func constraint(
        to anchor: NSLayoutXAxisAnchor,
        relation: ConstraintRelation
        ) -> NSLayoutConstraint {
        switch relation {
        case .equal:
            return constraint(equalTo: anchor)
        case .equalOrLess:
            return constraint(lessThanOrEqualTo: anchor)
        case .equalOrGreater:
            return constraint(greaterThanOrEqualTo: anchor)
        }
    }
}

extension NSLayoutYAxisAnchor {

    internal func constraint(
        to anchor: NSLayoutYAxisAnchor,
        relation: ConstraintRelation
        ) -> NSLayoutConstraint {
        switch relation {
        case .equal:
            return constraint(equalTo: anchor)
        case .equalOrLess:
            return constraint(lessThanOrEqualTo: anchor)
        case .equalOrGreater:
            return constraint(greaterThanOrEqualTo: anchor)
        }
    }
}

extension NSLayoutConstraint {

    internal func priority(_ priority: UILayoutPriority) -> Self {
        self.priority = priority
        return self
    }

    internal func offset(_ offset: CGFloat) -> Self {
        constant = offset
        return self
    }

    internal func activate() -> Self {
        isActive = true
        return self
    }

    internal func deactivate() -> Self {
        isActive = false
        return self
    }
}

extension NSLayoutDimension {
    
    internal func constraint(
        to dimension: NSLayoutDimension,
        multiplier: CGFloat,
        relation: ConstraintRelation
        ) -> NSLayoutConstraint {
        switch relation {
        case .equal:
            return constraint(equalTo: dimension, multiplier: multiplier)
        case .equalOrLess:
            return constraint(lessThanOrEqualTo: dimension, multiplier: multiplier)
        case .equalOrGreater:
            return constraint(greaterThanOrEqualTo: dimension, multiplier: multiplier)
        }
    }

    internal func constraint(
        toConstant constant: CGFloat,
        relation: ConstraintRelation = .equal
        ) -> NSLayoutConstraint {
        switch relation {
        case .equal:
            return constraint(equalToConstant: constant)
        case .equalOrLess:
            return constraint(lessThanOrEqualToConstant: constant)
        case .equalOrGreater:
            return constraint(greaterThanOrEqualToConstant: constant)
        }
    }
}

extension Constrainable {

    @discardableResult
    public func pinToEdges(of view: UIView? = nil, withInsets insets: UIEdgeInsets, safeConstrainable constrainable: Bool = false) -> Self {
        if #available(iOS 11.0, *), constrainable {
            return top(to: \.safeAreaLayoutGuide.topAnchor, of: view, constant: insets.top)
                .right(to: \.safeAreaLayoutGuide.rightAnchor, of: view, constant: insets.right)
                .bottom(to: \.safeAreaLayoutGuide.bottomAnchor, of: view, constant: insets.bottom)
                .left(to: \.safeAreaLayoutGuide.leftAnchor, of: view, constant: insets.left)
        }
        
        return top(to: \.topAnchor, of: view, constant: insets.top)
            .right(to: \.rightAnchor, of: view, constant: insets.right)
            .bottom(to: \.bottomAnchor, of: view, constant: insets.bottom)
            .left(to: \.leftAnchor, of: view, constant: insets.left)
        
    }
    
    @discardableResult
    public func pinToEdges(of view: UIView? = nil, withMargin margin: CGFloat = 0, safeConstrainable constrainable: Bool = false) -> Self {
        let insets = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        return pinToEdges(of: view, withInsets: insets, safeConstrainable: constrainable)

    }

    @discardableResult
    public func center(in view: UIView? = nil, withMargin margin: CGFloat = 0, relation: ConstraintRelation = .equal) -> Self {
        return centerX(to: \.centerXAnchor, of: view, relation: relation, constant: margin)
            .centerY(to: \.centerYAnchor, of: view, relation: relation, constant: margin)
    }

    @discardableResult
    public func size(_ size: CGSize, relation: ConstraintRelation = .equal) -> Self {
        return width(size.width, relation: relation)
            .height(size.height, relation: relation)
    }
}
