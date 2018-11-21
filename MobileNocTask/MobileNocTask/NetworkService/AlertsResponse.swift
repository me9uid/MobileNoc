//
//  AlertsResponse.swift
//  MobileNocTask
//
//  Created by Ahmed Meguid on 11/21/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation
import Alamofire

struct AlertResponse: Codable {
    let content: [Alert]
    let last: Bool
}

extension DataRequest {
    @discardableResult
    func responseAlertResponse(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<AlertResponse>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
}
