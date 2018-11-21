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
    var network: NetworkProtocol = NetworkService()
    
    private var currentPage = 0
    private var stillLoading = false
    
    init() {
        self.data = Dynamic([])
        fetchMoreData()
    }
    
    func update() {
        if stillLoading {
            fetchMoreData()
        }
    }
    
    func fetchMoreData() {
        network.getAlertsList(page: currentPage, size: 15).then { (response) in
            DispatchQueue.main.async {
                self.currentPage += 1
                let newData = self.filter(response.content)
                self.data.value.append(contentsOf: newData)
                self.stillLoading = !response.last
            }
        }
    }
    
    func filter(_ alerts: [Alert]) -> [Alert] {
        return alerts.filter({ alert in !data.value.contains( where: {$0.id == alert.id })})
    }
}
