//
//  ViewController.swift
//  AutolycusDemo
//
//  Created by Harlan Kellaway on 11/3/17.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import Autolycus
import UIKit

class ViewController: UIViewController {
    
    let myView = UIView()
    let secondView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.backgroundColor = .magenta
        secondView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        secondView.backgroundColor = .blue
        secondView.center = view.center
        
        view.addSubview(secondView)
        secondView.addSubview(myView)
        
        myView.constrain().widthToSuperview()
        myView.constrain().heightToSuperview()
        myView.constrain().centerInSuperview(offset: CGPoint(x: 50, y: 50))
    }
    
    private func manual() {
        myView.constrain()
        let constraints = [myView.leadingToTrailing(of: secondView)]
            + [myView.topToBottom(of: secondView)]
            + myView.size(CGSize(width: 50, height: 50))
        NSLayoutConstraint.activate(constraints)
    }

}
