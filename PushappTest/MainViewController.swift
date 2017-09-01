//
//  ViewController.swift
//  PushappTest
//
//  Created by Георгий Кажуро on 31.08.17.
//  Copyright © 2017 Георгий Кажуро. All rights reserved.
//

import UIKit
import SideMenu

class MainViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel! {
        didSet {
            welcomeLabel.alpha = 0.0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2.0, animations: {
            self.welcomeLabel.alpha = 1.0
        })
        
    }
}

