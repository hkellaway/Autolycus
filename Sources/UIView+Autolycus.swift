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
    func constrain() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    /// Whether the view is ready for programmatic AutoLayout.
    /// i.e. If translatesAutoresizingMaskIntoConstraints is false.
    ///
    /// - Returns: View instance acted upon.
    func isPreparedForAutoLayout() -> Bool {
        return !translatesAutoresizingMaskIntoConstraints
    }
    
    // MARK: - Constraints
    
    /// Constraints for setting centerX of view to anchor of another.
    /// If no anchor is provided, defaults to centerX.
    ///
    /// - Parameters:
    ///   - view: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Realtions. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func centerX(to view: UIView,
                        anchor: NSLayoutXAxisAnchor? = nil,
                        offset: CGFloat = 0,
                        priority: UILayoutPriority = .required,
                        isActive: Bool = true,
                        logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }
        
        return centerXAnchor.constraint(equalTo: anchor ?? view.centerXAnchor, constant: offset).priority(priority).activate(isActive)
    }
    
    /// Constraints for setting centerY of view to anchor of another.
    /// If no anchor is provided, defaults to centerY.
    ///
    /// - Parameters:
    ///   - view: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Realtions. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func centerY(to view: UIView,
                        anchor: NSLayoutYAxisAnchor? = nil,
                        offset: CGFloat = 0,
                        priority: UILayoutPriority = .required,
                        isActive: Bool = true,
                        logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }
        
        return centerYAnchor.constraint(equalTo: anchor ?? view.centerYAnchor, constant: offset).priority(priority).activate(isActive)
    }
    
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
    func inCenter(of view: UIView,
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
    
    /// Constraints for pinning edges of one view to another.
    ///
    /// - Parameters:
    ///   - view: View to pin to.
    ///   - insets: Insets. Defaults to zero.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger:  Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func edges(to view: UIView,
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
    
    /// Constraints for setting view size.
    ///
    /// - Parameters:
    ///   - size: Size.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger:  Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func size(_ size: CGSize,
                     priority: UILayoutPriority = .required,
                     isActive: Bool = true,
                     logger: Logger = AutolycusLogger.shared) -> [NSLayoutConstraint] {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return []
        }
        
        let constraints = [
            widthAnchor.constraint(equalToConstant: size.width).priority(priority),
            heightAnchor.constraint(equalToConstant: size.height).priority(priority)
        ]
        
        if isActive {
            NSLayoutConstraint.activate(constraints)
        }
        
        return constraints
    }
    
    /// Constraints for setting size to another view's size.
    ///
    /// - Parameters:
    ///   - view: View to replicate size of.
    ///   - multiplier: Multiplize. Defaults to 1.
    ///   - offset: Offset. Defaults to 0.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger:  Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func size(of view: UIView,
                     multiplier: CGFloat = 1,
                     offset: CGFloat = 0,
                     priority: UILayoutPriority = .required,
                     isActive: Bool = true,
                     logger: Logger = AutolycusLogger.shared) -> [NSLayoutConstraint] {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return []
        }
        
        let constraints = [
            widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier, constant: offset).priority(priority),
            heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier, constant: offset).priority(priority)
        ]
        
        if isActive {
            NSLayoutConstraint.activate(constraints)
        }
        
        return constraints
    }
    
    /// Constraints for setting origin to another view's origin.
    ///
    /// - Parameters:
    ///   - view: View to replicate origin of.
    ///   - insets: Insets. Defaults to zero.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger:  Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func origin(to view: UIView,
                       insets: CGVector = .zero,
                       priority: UILayoutPriority = .required,
                       isActive: Bool = true,
                       logger: Logger = AutolycusLogger.shared) -> [NSLayoutConstraint] {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return []
        }
        
        let constraints = [
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.dx).priority(priority),
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.dy).priority(priority)
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
    func width(_ width: CGFloat,
                      priority: UILayoutPriority = .required,
                      isActive: Bool = true,
                      logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }
        
        return widthAnchor.constraint(equalToConstant: width).priority(priority).activate(isActive)
    }
    
    /// Constraint for setting width of view.
    ///
    /// - Parameters:
    ///   - view. View to base width on.
    ///   - dimension: Dimension. Defaults to using other view's widthAnchor.
    ///   - multiplier: Multiplier. Defaults to 1.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Relation. Defaults to equal.
    ///   - priority: Priority. Defaults to rquired.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraint.
    @discardableResult
    func width(to view: UIView,
                      dimension: NSLayoutDimension? = nil,
                      multiplier: CGFloat = 1,
                      offset: CGFloat = 0,
                      relation: NSLayoutConstraint.Relation = .equal,
                      priority: UILayoutPriority = .required,
                      isActive: Bool = true,
                      logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }

        switch relation {
        case .equal:
            return widthAnchor.constraint(equalTo: dimension ?? view.widthAnchor, multiplier: multiplier, constant: offset).priority(priority).activate(isActive)
        case .lessThanOrEqual:
            return widthAnchor.constraint(lessThanOrEqualTo: dimension ?? view.widthAnchor, multiplier: multiplier, constant: offset).priority(priority).activate(isActive)
        case .greaterThanOrEqual:
            return widthAnchor.constraint(greaterThanOrEqualTo: dimension ?? view.widthAnchor, multiplier: multiplier, constant: offset).priority(priority).activate(isActive)
        @unknown default:
            fatalError()
        }
    }
    
    /// Constraint for setting width minimum and/or maximum.
    ///
    /// - Parameters:
    ///   - min: Minimum.
    ///   - max: Maximum.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func width(min: CGFloat? = nil,
                      max: CGFloat? = nil,
                      priority: UILayoutPriority = .required,
                      isActive: Bool = true,
                      logger: Logger = AutolycusLogger.shared) -> [NSLayoutConstraint] {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return []
        }
        
        var constraints: [NSLayoutConstraint] = []
        
        if let min = min {
            let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: min).priority(priority)
            constraint.isActive = isActive
            constraints.append(constraint)
        }
        
        if let max = max {
            let constraint = widthAnchor.constraint(lessThanOrEqualToConstant: max).priority(priority)
            constraint.isActive = isActive
            constraints.append(constraint)
        }
        
        return constraints
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
    func height(_ height: CGFloat,
                       priority: UILayoutPriority = .required,
                       isActive: Bool = true,
                       logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }
        
        return heightAnchor.constraint(equalToConstant: height).priority(priority).activate(isActive)
    }
    
    /// Constraint for setting height of view.
    ///
    /// - Parameters:
    ///   - view. View to base width on.
    ///   - dimension: Dimension. Defaults to using other view's heightAnchor.
    ///   - multiplier: Multiplier. Defaults to 1.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Relation. Defaults to equal.
    ///   - priority: Priority. Defaults to rquired.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraint.
    @discardableResult
    func height(to view: UIView,
                       dimension: NSLayoutDimension? = nil,
                       multiplier: CGFloat = 1,
                       offset: CGFloat = 0,
                       relation: NSLayoutConstraint.Relation = .equal,
                       priority: UILayoutPriority = .required,
                       isActive: Bool = true,
                       logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }
        
        switch relation {
        case .equal:
            return heightAnchor.constraint(equalTo: dimension ?? view.heightAnchor, multiplier: multiplier, constant: offset).priority(priority).activate(isActive)
        case .lessThanOrEqual:
            return heightAnchor.constraint(lessThanOrEqualTo: dimension ?? view.heightAnchor, multiplier: multiplier, constant: offset).priority(priority).activate(isActive)
        case .greaterThanOrEqual:
            return heightAnchor.constraint(greaterThanOrEqualTo: dimension ?? view.heightAnchor, multiplier: multiplier, constant: offset).priority(priority).activate(isActive)
        @unknown default:
            fatalError()
        }
    }
    
    /// Constraint for setting height minimum and/or maximum.
    ///
    /// - Parameters:
    ///   - min: Minimum.
    ///   - max: Maximum.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func height(min: CGFloat? = nil,
                       max: CGFloat? = nil,
                       priority: UILayoutPriority = .required,
                       isActive: Bool = true,
                       logger: Logger = AutolycusLogger.shared) -> [NSLayoutConstraint] {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return []
        }
        
        var constraints: [NSLayoutConstraint] = []
        
        if let min = min {
            let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: min).priority(priority)
            constraint.isActive = isActive
            constraints.append(constraint)
        }
        
        if let max = max {
            let constraint = heightAnchor.constraint(lessThanOrEqualToConstant: max).priority(priority)
            constraint.isActive = isActive
            constraints.append(constraint)
        }
        
        return constraints
    }
    
    /// Constraints for setting leading of view to trailing of another.
    ///
    /// - Parameters:
    ///   - view: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Realtions. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func leadingToTrailing(of view: UIView,
                                  offset: CGFloat = 0,
                                  relation: NSLayoutConstraint.Relation = .equal,
                                  priority: UILayoutPriority = .required,
                                  isActive: Bool = true,
                                  logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }
        
        return leading(to: view, anchor: view.trailingAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting leading of view to anchor of another.
    /// If no anchor is provided, defaults to leading.
    ///
    /// - Parameters:
    ///   - view: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Realtions. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func leading(to view: UIView,
                        anchor: NSLayoutXAxisAnchor? = nil,
                        offset: CGFloat = 0,
                        relation: NSLayoutConstraint.Relation = .equal,
                        priority: UILayoutPriority = .required,
                        isActive: Bool = true,
                        logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }
        
        switch relation {
        case .equal:
            return leadingAnchor.constraint(equalTo: anchor ?? view.leadingAnchor, constant: offset).priority(priority).activate(isActive)
        case .lessThanOrEqual:
            return leadingAnchor.constraint(lessThanOrEqualTo: anchor ?? view.leadingAnchor, constant: offset).priority(priority).activate(isActive)
        case .greaterThanOrEqual:
            return leadingAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.leadingAnchor, constant: offset).priority(priority).activate(isActive)
        @unknown default:
            fatalError()
        }
    }
    
    /// Constraints for setting left of view to right of another.
    ///
    /// - Parameters:
    ///   - view: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Realtions. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func leftToRight(of view: UIView,
                            offset: CGFloat = 0,
                            relation: NSLayoutConstraint.Relation = .equal,
                            priority: UILayoutPriority = .required,
                            isActive: Bool = true,
                            logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }
        
        return left(to: view, anchor: view.rightAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting left of view to anchor of another.
    /// If no anchor is provided, defaults to left.
    ///
    /// - Parameters:
    ///   - view: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Realtions. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func left(to view: UIView,
                        anchor: NSLayoutXAxisAnchor? = nil,
                        offset: CGFloat = 0,
                        relation: NSLayoutConstraint.Relation = .equal,
                        priority: UILayoutPriority = .required,
                        isActive: Bool = true,
                        logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }
        
        switch relation {
        case .equal:
            return leftAnchor.constraint(equalTo: anchor ?? view.leftAnchor, constant: offset).priority(priority).activate(isActive)
        case .lessThanOrEqual:
            return leftAnchor.constraint(lessThanOrEqualTo: anchor ?? view.leftAnchor, constant: offset).priority(priority).activate(isActive)
        case .greaterThanOrEqual:
            return leftAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.leftAnchor, constant: offset).priority(priority).activate(isActive)
        @unknown default:
            fatalError()
        }
    }
    
    /// Constraints for setting trailing of view to leading of another.
    ///
    /// - Parameters:
    ///   - view: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Realtions. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func trailingToLeading(of view: UIView,
                                  offset: CGFloat = 0,
                                  relation: NSLayoutConstraint.Relation = .equal,
                                  priority: UILayoutPriority = .required,
                                  isActive: Bool = true,
                                  logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }
        
        return trailing(to: view, anchor: view.leadingAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting trailing of view to anchor of another.
    /// If no anchor is provided, defaults to trailing.
    ///
    /// - Parameters:
    ///   - view: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Realtions. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func trailing(to view: UIView,
                         anchor: NSLayoutXAxisAnchor? = nil,
                         offset: CGFloat = 0,
                         relation: NSLayoutConstraint.Relation = .equal,
                         priority: UILayoutPriority = .required,
                         isActive: Bool = true,
                         logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }
        
        switch relation {
        case .equal:
            return trailingAnchor.constraint(equalTo: anchor ?? view.trailingAnchor, constant: offset).priority(priority).activate(isActive)
        case .lessThanOrEqual:
            return trailingAnchor.constraint(lessThanOrEqualTo: anchor ?? view.trailingAnchor, constant: offset).priority(priority).activate(isActive)
        case .greaterThanOrEqual:
            return trailingAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.trailingAnchor, constant: offset).priority(priority).activate(isActive)
        @unknown default:
            fatalError()
        }
    }
    
    /// Constraints for setting right of view to left of another.
    ///
    /// - Parameters:
    ///   - view: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Realtions. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func rightToLeft(of view: UIView,
                            offset: CGFloat = 0,
                            relation: NSLayoutConstraint.Relation = .equal,
                            priority: UILayoutPriority = .required,
                            isActive: Bool = true,
                            logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }
        
        return right(to: view, anchor: view.leftAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting right of view to anchor of another.
    /// If no anchor is provided, defaults to right.
    ///
    /// - Parameters:
    ///   - view: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Realtions. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func right(to view: UIView,
                      anchor: NSLayoutXAxisAnchor? = nil,
                      offset: CGFloat = 0,
                      relation: NSLayoutConstraint.Relation = .equal,
                      priority: UILayoutPriority = .required,
                      isActive: Bool = true,
                      logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }
        
        switch relation {
        case .equal:
            return rightAnchor.constraint(equalTo: anchor ?? view.rightAnchor, constant: offset).priority(priority).activate(isActive)
        case .lessThanOrEqual:
            return rightAnchor.constraint(lessThanOrEqualTo: anchor ?? view.rightAnchor, constant: offset).priority(priority).activate(isActive)
        case .greaterThanOrEqual:
            return rightAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.rightAnchor, constant: offset).priority(priority).activate(isActive)
        @unknown default:
            fatalError()
        }
    }
    
    /// Constraints for setting top of view to bottom of another.
    ///
    /// - Parameters:
    ///   - view: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Realtions. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func topToBottom(of view: UIView,
                            offset: CGFloat = 0,
                            relation: NSLayoutConstraint.Relation = .equal,
                            priority: UILayoutPriority = .required,
                            isActive: Bool = true,
                            logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }
        
        return top(to: view, anchor: view.bottomAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting top of view to anchor of another.
    /// If no anchor is provided, defaults to top.
    ///
    /// - Parameters:
    ///   - view: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Realtions. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func top(to view: UIView,
                      anchor: NSLayoutYAxisAnchor? = nil,
                      offset: CGFloat = 0,
                      relation: NSLayoutConstraint.Relation = .equal,
                      priority: UILayoutPriority = .required,
                      isActive: Bool = true,
                      logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }
        
        switch relation {
        case .equal:
            return topAnchor.constraint(equalTo: anchor ?? view.topAnchor, constant: offset).priority(priority).activate(isActive)
        case .lessThanOrEqual:
            return topAnchor.constraint(lessThanOrEqualTo: anchor ?? view.topAnchor, constant: offset).priority(priority).activate(isActive)
        case .greaterThanOrEqual:
            return topAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.topAnchor, constant: offset).priority(priority).activate(isActive)
        @unknown default:
            fatalError()
        }
    }
    
    /// Constraints for setting bottom of view to top of another.
    ///
    /// - Parameters:
    ///   - view: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Realtions. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func bottomToTop(of view: UIView,
                            offset: CGFloat = 0,
                            relation: NSLayoutConstraint.Relation = .equal,
                            priority: UILayoutPriority = .required,
                            isActive: Bool = true,
                            logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }
        
        return bottom(to: view, anchor: view.topAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting bottom of view to anchor of another.
    /// If no anchor is provided, defaults to bottom.
    ///
    /// - Parameters:
    ///   - view: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Realtions. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func bottom(to view: UIView,
                       anchor: NSLayoutYAxisAnchor? = nil,
                       offset: CGFloat = 0,
                       relation: NSLayoutConstraint.Relation = .equal,
                       priority: UILayoutPriority = .required,
                       isActive: Bool = true,
                       logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard isPreparedForAutoLayout() else {
            logger.log(AutolycusLogger.prepareForAutoLayoutMessage)
            return NSLayoutConstraint()
        }
        
        switch relation {
        case .equal:
            return bottomAnchor.constraint(equalTo: anchor ?? view.bottomAnchor, constant: offset).priority(priority).activate(isActive)
        case .lessThanOrEqual:
            return bottomAnchor.constraint(lessThanOrEqualTo: anchor ?? view.bottomAnchor, constant: offset).priority(priority).activate(isActive)
        case .greaterThanOrEqual:
            return bottomAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.bottomAnchor, constant: offset).priority(priority).activate(isActive)
        @unknown default:
            fatalError()
        }
    }
    
    // MARK: Superview
    
    /// Constraints for setting centerX of view to anchor of superview.
    /// If no anchor is provided, defaults to centerX.
    ///
    /// - Parameters:
    ///   - view: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Realtions. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func centerXToSuperview(_ anchor: NSLayoutXAxisAnchor? = nil,
                                   offset: CGFloat = 0,
                                   priority: UILayoutPriority = .required,
                                   isActive: Bool = true,
                                   logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard let superview = superview else {
            logger.log(AutolycusLogger.nilSuperviewMessage)
            return NSLayoutConstraint()
        }
        
        return centerX(to: superview, anchor: anchor, offset: offset, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting centerY of view to anchor of superview.
    /// If no anchor is provided, defaults to centerY.
    ///
    /// - Parameters:
    ///   - view: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Realtions. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func centerYToSuperview(_ anchor: NSLayoutYAxisAnchor? = nil,
                                   offset: CGFloat = 0,
                                   priority: UILayoutPriority = .required,
                                   isActive: Bool = true,
                                   logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard let superview = superview else {
            logger.log(AutolycusLogger.nilSuperviewMessage)
            return NSLayoutConstraint()
        }
        
        return centerY(to: superview, anchor: anchor, offset: offset, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting center of view to center of superview.
    ///
    /// - Parameters:
    ///   - offset: Offset. Defaults to zero.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func centerInSuperview(offset: CGPoint = .zero,
                                  priority: UILayoutPriority = .required,
                                  isActive: Bool = true,
                                  logger: Logger = AutolycusLogger.shared) -> [NSLayoutConstraint] {
        guard let superview = superview else {
            logger.log(AutolycusLogger.nilSuperviewMessage)
            return []
        }
        
        return inCenter(of: superview, offset: offset, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting edges of view to superview.
    ///
    /// - Parameters:
    ///   - insets: View to constrain to.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func edgesToSuperview(insets: UIEdgeInsets = .zero,
                                 priority: UILayoutPriority = .required,
                                 isActive: Bool = true,
                                 logger: Logger = AutolycusLogger.shared) -> [NSLayoutConstraint] {
        guard let superview = superview else {
            logger.log(AutolycusLogger.nilSuperviewMessage)
            return []
        }
        
        return edges(to: superview, insets: insets, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting size of view to superview.
    ///
    /// - Parameters:
    ///   - multiplier: Multiplizer. Defaults to 1.
    ///   - offset: Offset. Defaults to 0.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func sizeOfSuperview(multiplier: CGFloat = 1,
                                offset: CGFloat = 0,
                                priority: UILayoutPriority = .required,
                                isActive: Bool = true,
                                logger: Logger = AutolycusLogger.shared) -> [NSLayoutConstraint] {
        guard let superview = superview else {
            logger.log(AutolycusLogger.nilSuperviewMessage)
            return []
        }
        
        return size(of: superview, multiplier: multiplier, offset: offset, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting origin of view to superview.
    ///
    /// - Parameters:
    ///   - insets: Insets. Defaults to zero.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constriants.
    @discardableResult
    func originToSuperview(insets: CGVector = .zero,
                                  priority: UILayoutPriority = .required,
                                  isActive: Bool = true,
                                  logger: Logger = AutolycusLogger.shared) -> [NSLayoutConstraint] {
        guard let superview = superview else {
            logger.log(AutolycusLogger.nilSuperviewMessage)
            return []
        }
        
        return origin(to: superview, insets: insets, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting width of view to superview.
    ///
    /// - Parameters:
    ///   - dimension: Dimension.
    ///   - multiplier: Multiplier. Defaults to 1.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Relation. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func widthToSuperview( _ dimension: NSLayoutDimension? = nil,
                                  multiplier: CGFloat = 1,
                                  offset: CGFloat = 0,
                                  relation: NSLayoutConstraint.Relation = .equal,
                                  priority: UILayoutPriority = .required,
                                  isActive: Bool = true,
                                  logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard let superview = superview else {
            logger.log(AutolycusLogger.nilSuperviewMessage)
            return NSLayoutConstraint()
        }
        
        return width(to: superview, dimension: dimension, multiplier: multiplier, offset: offset, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting height of view to superview.
    ///
    /// - Parameters:
    ///   - dimension: Dimension.
    ///   - multiplier: Multiplier. Defaults to 1.
    ///   - offset: Offset. Defaults to 0.
    ///   - relation: Relation. Defaults to equal.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func heightToSuperview( _ dimension: NSLayoutDimension? = nil,
                                   multiplier: CGFloat = 1,
                                   offset: CGFloat = 0,
                                   relation: NSLayoutConstraint.Relation = .equal,
                                   priority: UILayoutPriority = .required,
                                   isActive: Bool = true,
                                   logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard let superview = superview else {
            logger.log(AutolycusLogger.nilSuperviewMessage)
            return NSLayoutConstraint()
        }
        
        return height(to: superview, dimension: dimension, multiplier: multiplier, offset: offset, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting leading of view to anchor of superview.
    /// If no anchor is provided, defaults to leading.
    ///
    /// - Parameters:
    ///   - anchor: Anchor to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func leadingToSuperview(_ anchor: NSLayoutXAxisAnchor? = nil,
                                   offset: CGFloat = 0,
                                   priority: UILayoutPriority = .required,
                                   isActive: Bool = true,
                                   logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard let superview = superview else {
            logger.log(AutolycusLogger.nilSuperviewMessage)
            return NSLayoutConstraint()
        }
        
        return leading(to: superview, anchor: anchor, offset: offset, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting left of view to anchor of superview.
    /// If no anchor is provided, defaults to left.
    ///
    /// - Parameters:
    ///   - anchor: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func leftToSuperview(_ anchor: NSLayoutXAxisAnchor? = nil,
                                offset: CGFloat = 0,
                                priority: UILayoutPriority = .required,
                                isActive: Bool = true,
                                logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard let superview = superview else {
            logger.log(AutolycusLogger.nilSuperviewMessage)
            return NSLayoutConstraint()
        }
        
        return left(to: superview, anchor: anchor, offset: offset, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting trailing of view to anchor of superview.
    /// If no anchor is provided, defaults to trailing.
    ///
    /// - Parameters:
    ///   - anchor: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func trailingToSuperview(_ anchor: NSLayoutXAxisAnchor? = nil,
                                    offset: CGFloat = 0,
                                    priority: UILayoutPriority = .required,
                                    isActive: Bool = true,
                                    logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard let superview = superview else {
            logger.log(AutolycusLogger.nilSuperviewMessage)
            return NSLayoutConstraint()
        }
        
        return trailing(to: superview, anchor: anchor, offset: offset, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting right of view to anchor of superview.
    /// If no anchor is provided, defaults to right.
    ///
    /// - Parameters:
    ///   - anchor: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func rightToSuperview(_ anchor: NSLayoutXAxisAnchor? = nil,
                                 offset: CGFloat = 0,
                                 priority: UILayoutPriority = .required,
                                 isActive: Bool = true,
                                 logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard let superview = superview else {
            logger.log(AutolycusLogger.nilSuperviewMessage)
            return NSLayoutConstraint()
        }
        
        return right(to: superview, anchor: anchor, offset: offset, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting top of view to anchor of superview.
    /// If no anchor is provided, defaults to top.
    ///
    /// - Parameters:
    ///   - anchor: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func topToSuperview(_ anchor: NSLayoutYAxisAnchor? = nil,
                               offset: CGFloat = 0,
                               priority: UILayoutPriority = .required,
                               isActive: Bool = true,
                               logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard let superview = superview else {
            logger.log(AutolycusLogger.nilSuperviewMessage)
            return NSLayoutConstraint()
        }
        
        return top(to: superview, anchor: anchor, offset: offset, priority: priority, isActive: isActive, logger: logger)
    }
    
    /// Constraints for setting bottom of view to anchor of superview.
    /// If no anchor is provided, defaults to bottom.
    ///
    /// - Parameters:
    ///   - anchor: View to constrain to.
    ///   - offset: Offset. Defaults to 0.
    ///   - priority: Priority. Defaults to required.
    ///   - isActive: Whether the constraint should be active. Defaults to true.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: Constraints.
    @discardableResult
    func bottomToSuperview(_ anchor: NSLayoutYAxisAnchor? = nil,
                                  offset: CGFloat = 0,
                                  priority: UILayoutPriority = .required,
                                  isActive: Bool = true,
                                  logger: Logger = AutolycusLogger.shared) -> NSLayoutConstraint {
        guard let superview = superview else {
            logger.log(AutolycusLogger.nilSuperviewMessage)
            return NSLayoutConstraint()
        }
        
        return bottom(to: superview, anchor: anchor, offset: offset, priority: priority, isActive: isActive, logger: logger)
    }
    
    // MARK: - Convenience
    
    /// Constrains the view to the provided width and returns same instance.
    ///
    /// - Parameters:
    ///   - value: Width.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: View instance acted upon.
    @discardableResult
    func toWidth(_ value: CGFloat,
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
    func toHeight(_ value: CGFloat,
                         logger: Logger = AutolycusLogger.shared) -> Self {
        height(value, logger: logger)
        return self
    }
    
    /// Constrains the view to provided size and returns same instance.
    ///
    /// - Parameters:
    ///   - sizeValue: Size.
    ///   - logger: Logger for issues enacting constraints.
    /// - Returns: View instance acted upon.
    @discardableResult
    func toSize(_ sizeValue: CGSize,
                       logger: Logger = AutolycusLogger.shared) -> Self {
        size(sizeValue, logger: logger)
        return self
    }
    
}
