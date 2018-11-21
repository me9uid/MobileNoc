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

class DataSourceTests: XCTestCase {
    
    var dataSource: AlertsDataSourceImpl!
    
    override func tearDown() {
        dataSource = nil
    }
    
    func testToUpdateWhileMoreDataShouldCallNetwork() {
        let network = NetworkMock()
        dataSource = AlertsDataSourceImpl(network: network)
        dataSource.shouldLoadMore = true
        network.called = false

        dataSource.update()
        
        XCTAssert(network.called)
    }
    
    func testToUpdateWhileMoreDataShouldNotCallNetwork() {
        let network = NetworkMock()
        dataSource = AlertsDataSourceImpl(network: network)
        dataSource.shouldLoadMore = false
        network.called = false

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
        let alert = Alert(id: 0, name: "", ipAddress: "", ipSubnetMask: "", status: Status(id: 0, statusValue: ""))
        let network = NetworkMock(status: true, object: AlertResponse(content: [alert], last: false))
        dataSource = AlertsDataSourceImpl(network: network)
        dataSource.data = Dynamic([])
        
        dataSource.fetchMoreData()
        _ = waitForPromises(timeout: 10)

        XCTAssertEqual(dataSource.data.value.count, 1)
        XCTAssertEqual(dataSource.shouldLoadMore, true)
    }
    
    func testToFetchRedundantDataShouldNotUpdateData() {
        let alert = Alert(id: 0, name: "", ipAddress: "", ipSubnetMask: "", status: Status(id: 0, statusValue: ""))
        let network = NetworkMock(status: true, object: AlertResponse(content: [alert, alert], last: true))
        dataSource = AlertsDataSourceImpl(network: network)
        dataSource.data = Dynamic([alert])
        
        dataSource.fetchMoreData()
        _ = waitForPromises(timeout: 10)
        
        XCTAssertEqual(dataSource.data.value.count, 1)
        XCTAssertEqual(dataSource.shouldLoadMore, false)
    }
}
