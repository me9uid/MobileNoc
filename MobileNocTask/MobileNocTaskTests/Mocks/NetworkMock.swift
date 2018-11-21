//
//  NetworkMock.swift
//  MobileNocTaskTests
//
//  Created by Ahmed Meguid on 11/21/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

@testable import MobileNocTask
@testable import Promises

class NetworkMock: NetworkProtocol {
    
    var status: Bool = false
    var object: AlertResponse?
    
    var called: Bool = false
    
    init() { }
    
    init(status: Bool, object: AlertResponse?) {
        self.status = status
        self.object = object
    }
    
    func getAlertsList(page: Int, size: Int) -> Promise<AlertResponse> {
        called = true
        return Promise<AlertResponse>(on: .main) { fulfill, reject in
            if self.status {
                fulfill(self.object!)
            }
        }
    }
}
