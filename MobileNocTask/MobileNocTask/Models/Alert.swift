//
//  Alert.swift
//  MobileNocTask
//
//  Created by Ahmed Meguid on 11/21/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

struct Alert: Codable {
    let id: Int!
    let name: String?
    let ipAddress: String?
    let ipSubnetMask: String?
    let status: Status?
    
    let location: String? = ["Brasil", "Argentina", "Egypt", "Jordan"].randomElement()
    let check: Bool? = [true, false].randomElement()
    let call: Bool? = [true, false].randomElement()
    let clock: Bool? = [true, false].randomElement()
    let mute: Bool? = [true, false].randomElement()
    
    init(name: String, ip: String, subnet: String, status: Status) {
        self.id = 0
        self.name = name
        self.ipAddress = ip
        self.ipSubnetMask = subnet
        self.status = status
    }
}
