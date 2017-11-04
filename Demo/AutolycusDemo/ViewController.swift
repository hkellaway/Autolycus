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
        view.addSubview(myView)
        
        myView.constrain().leadingToTrailing(of: secondView)
        myView.constrain().topToBottom(of: secondView)
        myView.constrain().size(CGSize(width: 50, height: 50))
    }
    
    private func manual() {
        myView.constrain()
        let constraints = [myView.leadingToTrailing(of: secondView)]
            + [myView.topToBottom(of: secondView)]
            + myView.size(CGSize(width: 50, height: 50))
        NSLayoutConstraint.activate(constraints)
    }

}
