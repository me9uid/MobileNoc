//
//  DataSourceMock.swift
//  MobileNocTaskTests
//
//  Created by Ahmed Meguid on 11/21/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

@testable import MobileNocTask

class DataSourceMock: AlertsDataSource {
    
    var data: Dynamic<[Alert]> = Dynamic([])
    
    var mockedData: [Alert] = []
    var called: Bool = false
    
    func update() {
        called = true
        data.value = mockedData
    }
}

