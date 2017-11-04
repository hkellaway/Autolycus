//
//  AutolycusLogger.swift
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

/// Logger printing messages to console.
public final class AutolycusLogger: Logger {
    
    // MARK: - Class properties
    
    /// Singleton instance.
    public static var shared = AutolycusLogger()
    
    /// Default message to log when constraint attempted before preparing.
    public static var prepareForAutoLayoutMessage = "Attempt to set constraints before preparing for AutoLayout. Call constrain()."
    
    // MARK: - Init/Deinit
    
    /// Creates new instance.
    public init() { }
    
    // MARK: - Protocol conformance
    
    // MARK: Log
    
    public func log(_ message: String) {
        print("[Autolycus] \(message)")
    }
    
}
