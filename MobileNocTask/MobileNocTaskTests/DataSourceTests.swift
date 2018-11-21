//
//  DataSourceTests.swift
//  MobileNocTaskTests
//
//  Created by Ahmed Meguid on 11/21/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

// Testing The Alert List's Data Source Impl with Mocking the Network

import XCTest
@testable import MobileNocTask
@testable import Promises

class NetworkMock: NetworkProtocol {
    
    var status: Bool = false
    var object: AlertResponse?
    
    var called: Bool = false
    
    init() {
    }
    
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

class DataSourceTests: XCTestCase {
    
    var dataSource: AlertsDataSourceImpl!
    
    override func tearDown() {
        dataSource = nil
    }
    
    func testToUpdateWhileMoreDataShouldCallNetwork() {
        let network = NetworkMock()
        dataSource = AlertsDataSourceImpl(network: network)
        network.called = false
        dataSource.shouldLoadMore = true
        
        dataSource.update()
        
        XCTAssert(network.called)
    }
    
    func testToUpdateWhileMoreDataShouldNotCallNetwork() {
        let network = NetworkMock()
        dataSource = AlertsDataSourceImpl(network: network)
        network.called = false
        dataSource.shouldLoadMore = false
        
        dataSource.update()
        
        XCTAssertFalse(network.called)
    }
    
    func testToFetchMoreDataWhileNetworkFailedShouldNotUpdateData() {
        let network = NetworkMock(status: false, object: nil)
        dataSource = AlertsDataSourceImpl(network: network)
        dataSource.currentPage = 0
        
        dataSource.fetchMoreData()
        
        XCTAssertEqual(dataSource.currentPage, 0)
    }
    
    func testToFetchMoreDataWhileNetworkSuccessedShouldUpdateData() {
        let network = NetworkMock(status: true, object: AlertResponse(content: [Alert(id: 0, name: "", ipAddress: "", ipSubnetMask: "", status: Status(id: 0, statusValue: "", legacyValue: ""))], last: false))
        dataSource = AlertsDataSourceImpl(network: network)
        dataSource.data = Dynamic([])
        
        dataSource.fetchMoreData()
        _ = waitForPromises(timeout: 10)

        XCTAssertEqual(dataSource.data.value.count, 1)
        XCTAssertEqual(dataSource.shouldLoadMore, true)
    }
    
    func testToFetchRedundantDataShouldNotUpdateData() {
        let alert = Alert(id: 0, name: "", ipAddress: "", ipSubnetMask: "", status: Status(id: 0, statusValue: "", legacyValue: ""))
        let network = NetworkMock(status: true, object: AlertResponse(content: [alert, alert], last: true))
        dataSource = AlertsDataSourceImpl(network: network)
        dataSource.data = Dynamic([alert])
        
        dataSource.fetchMoreData()
        _ = waitForPromises(timeout: 10)
        
        XCTAssertEqual(dataSource.data.value.count, 1)
        XCTAssertEqual(dataSource.shouldLoadMore, false)
    }
}
