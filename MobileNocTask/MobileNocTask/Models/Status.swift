//
//  Status.swift
//  MobileNocTask
//
//  Created by Ahmed Meguid on 11/21/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

struct Status: Codable {
    let id: Int! = [1, 2, 3, 4].randomElement()
    let statusValue: String = ""
    let legacyValue: String = ""
    
    init() {
    }
}
