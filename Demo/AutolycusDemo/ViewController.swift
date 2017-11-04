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
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        myView.backgroundColor = .magenta
        
        view.addSubview(myView)
        myView.constrain()
            .toSize(200, 200)
            .inCenter(of: view)
    }

}
