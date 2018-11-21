//
//  AlertCell.swift
//  MobileNocTask
//
//  Created by Ahmed Meguid on 11/21/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit

class AlertCell: UITableViewCell {

    @IBOutlet weak var content: UIView!

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var serverLabel: UILabel!
    
    @IBOutlet weak var ipLabel: UILabel!
    @IBOutlet weak var subnetLabel: UILabel!

    @IBOutlet weak var checkIcon: UIImageView!
    @IBOutlet weak var alertIcon: UIImageView!
    @IBOutlet weak var clockIcon: UIImageView!
    @IBOutlet weak var callIcon: UIImageView!

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusImage: UIImageView!

    override func setSelected(_ selected: Bool, animated: Bool) {
        if (selected) {
            content.backgroundColor = .cellSelectedBlue
        } else {
            content.backgroundColor = .white
        }
    }
}
