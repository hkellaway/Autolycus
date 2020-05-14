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
        
        myView.add(to: secondView)
            .width(to: \.widthAnchor)
            .height(to: \.heightAnchor)
            .centerX(to: \.centerXAnchor, constant: 50)
            .centerY(to: \.centerYAnchor, constant: 50)
    }
    
    private func manual() {
        myView.add(to: secondView)
        
        let constraints = [
            myView.addLeadingConstraint(to: \.trailingAnchor),
            myView.addTopConstraint(to: \.bottomAnchor),
            myView.addWidth(50),
            myView.addHeight(50)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}
