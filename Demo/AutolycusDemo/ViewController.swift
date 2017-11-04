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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = UIView()
        myView.backgroundColor = .magenta
        let secondView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        secondView.backgroundColor = .blue
        secondView.center = view.center
        
        view.addSubview(secondView)
        view.addSubview(myView)
        myView.constrain().inCenter(of: secondView)
        myView.constrain().width(min: 100)
        myView.constrain().height(min: 50)
    }

}
