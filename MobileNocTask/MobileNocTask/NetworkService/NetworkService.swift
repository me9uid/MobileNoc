//
//  NetworkService.swift
//  MobileNocTask
//
//  Created by Ahmed Meguid on 11/21/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation
import Alamofire
import Promises

protocol NetworkProtocol {
    func getAlertsList(page: Int, size: Int) -> Promise<AlertResponse>
}

class NetworkService: NetworkProtocol {
    
    private let username = "admin@boot.com"
    private let password = "admin"

    let manager: SessionManager = {
        return Alamofire.SessionManager(serverTrustPolicyManager: CustomServerTrustPoliceManager())
    }()
    
    func getAlertsList(page: Int, size: Int) -> Promise<AlertResponse> {
        let url = "https://45.55.43.15:9090/api/machine?" + "page=\(page)" + "&size=\(size)"
        let credentials = (username + ":" + password).data(using: String.Encoding.utf8)!.base64EncodedString()
        let headers = ["Authorization": "Basic \(credentials)"]

        return Promise<AlertResponse>(on: .main) { fulfill, reject in
            self.manager.request(URL(string: url)!,
                              method: .get,
                              parameters: nil,
                              encoding: URLEncoding.default,
                              headers: headers)
                .responseAlertResponse { response in
                    if let alertResponse = response.result.value {
                        fulfill(alertResponse)
                    } else {
                        reject(response.error ?? NSError())
                    }
            }
        }
    }
}

extension DataRequest {
    func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            return Result { try JSONDecoder().decode(T.self, from: data) }
        }
    }
}

class CustomServerTrustPoliceManager : ServerTrustPolicyManager {
    override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {
        return .disableEvaluation
    }
    
    public init() {
        super.init(policies: [:])
    }
}
