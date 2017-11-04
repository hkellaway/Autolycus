//
//  UIView+Autolycus.swift
//  Autolycus
//
// Copyright (c) 2017 Harlan Kellaway
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

public extension UIView {
    
    /// Prepares the view for programmatic constraints.
    /// i.e. Sets translatesAutoresizingMaskIntoConstraints to false.
    ///
    /// - Returns: View instance acted upon.
    @discardableResult
    public func constrain() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    /// Whether the view is ready for programmatic AutoLayout.
    /// i.e. If translatesAutoresizingMaskIntoConstraints is false.
    ///
    /// - Returns: View instance acted upon.
    public func isPreparedForAutoLayout() -> Bool {
        return !translatesAutoresizingMaskIntoConstraints
    }
    
    // MARK: - Constraints
    
    /// Constraints for centering view in another.
    ///
    /// - Parameters:
    ///   - view: View to center in.
    ///   - offset: Point offset from center. Defaults to zero.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    public func inCenter(of view: UIView,
                         offset: CGPoint = .zero,
                         priority: UILayoutPriority = .required,
                         isActive: Bool = true,
                         logger: Logger = AutolycusLogger.shared) -> [NSLayoutConstraint] {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return []
        }
        
        let constraints = [
            centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset.x).priority(priority),
            centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset.y).priority(priority)
        ]
        
        if isActive {
            NSLayoutConstraint.activate(constraints)
        }
        
        return constraints
    }
    
    @discardableResult
    public func edges(to view: UIView,
                      insets: UIEdgeInsets = .zero,
                      priority: UILayoutPriority = .required,
                      isActive: Bool = true,
                      logger: Logger = AutolycusLogger.shared) -> [NSLayoutConstraint] {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return []
        }
        
        let constraints = [
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).priority(priority),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left).priority(priority),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom).priority(priority),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets.right).priority(priority)
        ]
        
        if isActive {
            NSLayoutConstraint.activate(constraints)
        }
        
        return constraints
    }
    
    /// Constraint for setting width of view.
    ///
    /// - Parameters:
    ///   - width: Width.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraint.
    @discardableResult
    public func width(_ width: CGFloat,
                      priority: UILayoutPriority = .required,
                      isActive: Bool = true,
                      logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint.invalid()
        }
        
        return widthAnchor.constraint(equalToConstant: width).priority(priority).activate(isActive)
    }
    
    /// Constrant for setting height of view.
    ///
    /// - Parameters:
    ///   - height: Height.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraint.
    @discardableResult
    public func height(_ height: CGFloat,
                       priority: UILayoutPriority = .required,
                       isActive: Bool = true,
                       logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint.invalid()
        }
        
        return heightAnchor.constraint(equalToConstant: height).priority(priority).activate(isActive)
    }
    
    // MARK: - Convenience
    
    /// Constrains the view to the provided width and returns same instance.
    ///
    /// - Parameters:
    ///   - value: Width.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: View instance acted upon.
    @discardableResult
    public func toWidth(_ value: CGFloat,
                        logger: Logger = AutolycusLogger.shared) -> Self {
        width(value)
        return self
    }
    
    /// Constrains the view to the provided height and returns same instance.
    ///
    /// - Parameters:
    ///   - value: Height.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: View instance acted upon.
    @discardableResult
    public func toHeight(_ value: CGFloat,
                         logger: Logger = AutolycusLogger.shared) -> Self {
        height(value, logger: logger)
        return self
    }
    
    /// Constrains the view to provided size and returns same instance.
    ///
    /// - Parameters:
    ///   - widthValue: Width.
    ///   - heightValue: Height.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: View instance acted upon.
    @discardableResult
    public func toSize(_ widthValue: CGFloat,
                       _ heightValue: CGFloat,
                       logger: Logger = AutolycusLogger.shared) -> Self {
        toWidth(widthValue, logger: logger)
        toHeight(heightValue, logger: logger)
        return self
    }
    
}
