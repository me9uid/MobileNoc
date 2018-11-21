//
//  AlertsListTests.swift
//  MobileNocTaskTests
//
//  Created by Ahmed Meguid on 11/21/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

// Testing The Alert List's View with Mocking the Data Source

import XCTest
@testable import MobileNocTask

class AlertsListTests: XCTestCase {

    var alertsList: AlertsList = AlertsList()

    func testToScrollToBottomWhichShouldUpdateDataSource() {
        
        let dataSourceMock = DataSourceMock()
        dataSourceMock.called = false
        dataSourceMock.data.value = [alertWithId(0), alertWithId(1),alertWithId(2),alertWithId(3)]
        alertsList.dataSource = dataSourceMock
        
        scrollToBottom()
        alertsList.scrollViewDidScroll(alertsList.tableView)
        XCTAssert(dataSourceMock.called)
    }

    func scrollToBottom() {
        let index = self.alertsList.dataSource.data.value.count-1
        if index >= 0 {
            let indexPath = IndexPath(row: index, section: 0)
            self.alertsList.tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }
    
    func alertWithId(_ id: Int) -> Alert {
        return Alert(id: id, name: "", ipAddress: "", ipSubnetMask: "", status: Status(id: 0, statusValue: ""))
    }
}
