//
//  AlertsResponse.swift
//  MobileNocTask
//
//  Created by Ahmed Meguid on 11/21/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

struct AlertResponse: Codable {
    let content: [Alert]
    let first: Bool
    let last: Bool
    let totalPages, totalElements: Int
    let numberOfElements, size, number: Int
}
