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
    
    let location: String? = ["Brasil", "Egypt", "Jordan"].randomElement()
    let check: Bool? = [true, false].randomElement()
    let call: Bool? = [true, false].randomElement()
    let clock: Bool? = [true, false].randomElement()
    let mute: Bool? = [true, false].randomElement()
}
