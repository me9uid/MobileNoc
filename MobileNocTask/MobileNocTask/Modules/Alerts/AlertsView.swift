//
//  ViewController.swift
//  MobileNocTask
//
//  Created by Ahmed Meguid on 11/20/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit
import Promises

class AlertsView: UIViewController {

    @IBOutlet var filterButtons: [UIButton]!
    
    @IBAction func didUpdateFilter(_ sender: UIButton) {
        filterButtons.forEach { (button) in
            if button != sender {
                button.borderColor = .grayBorder
                button.backgroundColor = .white
                button.setTitleColor(.gray, for: .normal)
            } else {
                button.borderColor = .clear
                button.backgroundColor = .selectBlue
                button.setTitleColor(.white, for: .normal)
            }
        }
    }
}
