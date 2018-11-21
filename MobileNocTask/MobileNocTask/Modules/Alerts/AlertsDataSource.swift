//
//  AlertsDataSource.swift
//  MobileNocTask
//
//  Created by Ahmed Meguid on 11/21/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

protocol AlertsDataSource {
    var data: Dynamic<[Alert]> { set get }
    func update()
}

class AlertsDataSourceImpl: AlertsDataSource {
    
    var data: Dynamic<[Alert]>
    var network: NetworkProtocol
    
    var currentPage = 0
    var shouldLoadMore = false
    
    init(network: NetworkProtocol) {
        self.data = Dynamic([])
        self.network = network
        fetchMoreData()
    }
    
    func update() {
        if shouldLoadMore {
            fetchMoreData()
        }
    }
    
    func fetchMoreData() {
        network.getAlertsList(page: currentPage, size: 15).then { (response) in
            DispatchQueue.main.async {
                self.currentPage += 1
                let newData = self.filter(response.content)
                self.data.value.append(contentsOf: newData)
                self.shouldLoadMore = !response.last
            }
        }
    }
    
    func filter(_ alerts: [Alert]) -> [Alert] {
        return alerts.filter({ alert in !data.value.contains( where: {$0.id == alert.id })})
    }
}
