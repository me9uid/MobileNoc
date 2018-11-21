//
//  AlertsViewTests.swift
//  MobileNocTaskTests
//
//  Created by Ahmed Meguid on 11/21/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import XCTest
@testable import MobileNocTask

class AlertsViewTests: XCTestCase {

    var alertsView: AlertsView!
    
    override func setUp() {
        alertsView = AlertsView()
    }

    override func tearDown() {
        alertsView = nil
    }

    func testUpdateFilterButtonUI() {
        alertsView.filterButtons = [createButtonWithTag(101),
                                    createButtonWithTag(102),
                                    createButtonWithTag(103)]
        
        alertsView.didUpdateFilter(alertsView.filterButtons[1])
        
        alertsView.filterButtons.filter({$0.tag != 102}).forEach { (button) in
            XCTAssertEqual(button.borderColor, .grayBorder)
            XCTAssertEqual(button.backgroundColor, .white)
        }
        
        alertsView.filterButtons.filter({$0.tag == 102}).forEach { (button) in
            XCTAssertEqual(button.borderColor, .clear)
            XCTAssertEqual(button.backgroundColor, .selectBlue)
        }
    }
    
    func createButtonWithTag(_ tag: Int) -> UIButton {
        let button = UIButton()
        button.tag = tag
        return button
    }
}
