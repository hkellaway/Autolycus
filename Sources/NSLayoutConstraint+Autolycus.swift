//
//  NSLayoutConstraint+Autolycus.swift
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

import Foundation

extension NSLayoutConstraint {
    
    /// Sets priority of the constraint and returns same instance.
    ///
    /// - Parameter newPriority: Priority.
    /// - Returns: Constraint instance acted upon.
    func priority(_ newPriority: UILayoutPriority) -> Self {
        priority = newPriority
        return self
    }
    
    /// Sets isActive value of the constraint and returns same instance.
    ///
    /// - Parameter newIsActive: Whether the constraint is active.
    /// - Returns: Constraint instance acted upon.
    func activate(_ newIsActive: Bool) -> Self {
        isActive = newIsActive
        return self
    }
    
    /// Creates a new constraint with invalid values.
    /// Intended to be used where a constraint instance
    /// is required, but a valid constraint cannot be determined.
    ///
    /// - Returns: Invalid constraint.
    static func invalid() -> NSLayoutConstraint {
        return NSLayoutConstraint(item: NSObject(),
                                  attribute: .notAnAttribute,
                                  relatedBy: .equal,
                                  toItem: nil,
                                  attribute: .notAnAttribute,
                                  multiplier: 0,
                                  constant: 0)
    }
    
}
