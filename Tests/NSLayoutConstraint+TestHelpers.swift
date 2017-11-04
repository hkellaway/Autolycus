//
//  NSLayoutConstraint+TestHelpers.swift
//  Autolycus
//
//  Created by Harlan Kellaway on 11/4/17.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import XCTest
import UIKit

extension NSLayoutConstraint {
    
    func hasValues(firstItem firstItemTag: Int,
                   firstAttribute: NSLayoutAttribute,
                   relation: NSLayoutRelation,
                   secondItem secondItemTag: Int,
                   secondAttribute: NSLayoutAttribute) -> Bool {
        guard
            let firstTag = (self.firstItem as? UIView)?.tag,
            let secondTag = (self.secondItem as? UIView)?.tag else {
                return false
        }
        
        return firstTag == firstItemTag
            && secondTag == secondItemTag
            && self.firstAttribute == firstAttribute
            && self.relation == relation
            && self.secondAttribute == secondAttribute
    }
    
}
