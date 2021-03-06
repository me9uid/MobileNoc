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
    @IBOutlet weak var muteIcon: UIImageView!
    @IBOutlet weak var clockIcon: UIImageView!
    @IBOutlet weak var callIcon: UIImageView!

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusImage: UIImageView!

    var statuses: [(Int, UIImage)] = [(1, #imageLiteral(resourceName: "greenStatus")), (2, #imageLiteral(resourceName: "orangeStatus")), (3, #imageLiteral(resourceName: "yellowStatus")), (4, #imageLiteral(resourceName: "redStatus"))]
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if (selected) {
            content.backgroundColor = .cellSelectedBlue
        } else {
            content.backgroundColor = .white
        }
    }
    
    func configure(alert: Alert) {
        locationLabel.text = alert.location
        serverLabel.text = alert.name
        ipLabel.text = alert.ipAddress
        subnetLabel.text = alert.ipSubnetMask
        
        checkIcon.image = alert.check! ? #imageLiteral(resourceName: "checkON") : #imageLiteral(resourceName: "checkOFF")
        callIcon.image = alert.call! ? #imageLiteral(resourceName: "callON") : #imageLiteral(resourceName: "callOFF")
        clockIcon.image = alert.clock! ? #imageLiteral(resourceName: "clockON") : #imageLiteral(resourceName: "clockOFF")
        muteIcon.image = alert.mute! ? #imageLiteral(resourceName: "alertON") : #imageLiteral(resourceName: "alertOFF")
        
        let statusValue = alert.status?.statusValue
        statusLabel.text = statusValue
        statusLabel.isHidden = statusValue != nil ? false : true
        
        let status = statuses.filter({$0.0 == alert.status?.id}).first
        statusImage.isHidden = status != nil ? false : true
        statusImage.image = status?.1
    }
}
