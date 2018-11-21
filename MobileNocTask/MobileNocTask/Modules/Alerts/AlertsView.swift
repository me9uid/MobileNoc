//
//  ViewController.swift
//  MobileNocTask
//
//  Created by Ahmed Meguid on 11/20/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit

class AlertsView: UIViewController {

    private var list: AlertsListProtocol!

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
    
    override func viewDidAppear(_ animated: Bool) {
        list.update(alerts: [Alert(name: "A", ip: "B", subnet: "C", status: Status()), Alert(name: "A", ip: "B", subnet: "C", status: Status()), Alert(name: "A", ip: "B", subnet: "C", status: Status()), Alert(name: "A", ip: "B", subnet: "C", status: Status()), Alert(name: "A", ip: "X", subnet: "C", status: Status()), Alert(name: "A", ip: "B", subnet: "C", status: Status()), Alert(name: "A", ip: "B", subnet: "C", status: Status()), Alert(name: "A", ip: "B", subnet: "C", status: Status())])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "list" {
            self.list = segue.destination as? AlertsListProtocol
        }
    }
}
