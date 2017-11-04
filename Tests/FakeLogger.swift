//
//  FakeLogger.swift
//  Autolycus
//
//  Created by Harlan Kellaway on 11/3/17.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import XCTest
@testable import Autolycus

final class FakeLogger: Logger {
    
    var lastMessageLogged: String?
    
    init() {
        lastMessageLogged = nil
    }
    
    func log(_ message: String) {
        lastMessageLogged = message
    }
    
}
