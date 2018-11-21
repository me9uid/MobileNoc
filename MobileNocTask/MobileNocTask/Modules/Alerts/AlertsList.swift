//
//  AlertsList.swift
//  MobileNocTask
//
//  Created by Ahmed Meguid on 11/21/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit

class AlertsList: UITableViewController {

    private var alerts: [Alert] = []

    private var currentPage = 0
    private var stillLoading = false
    
    var network: NetworkProtocol = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib.init(nibName: "AlertCell", bundle: nil), forCellReuseIdentifier: "AlertCell")
        fetchMoreData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alerts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AlertCell", for: indexPath) as! AlertCell
            cell.configure(alert: alerts[indexPath.row])
            return cell
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if stillLoading {
            if tableView.contentOffset.y > (tableView.contentSize.height - tableView.frame.size.height) + 5 {
                fetchMoreData()
            }
        }
    }
}

extension AlertsList {
    func fetchMoreData() {
        network.getAlertsList(page: currentPage, size: 15).then { (response) in
            DispatchQueue.main.async {
                self.currentPage += 1
                let newAlerts = response.content.filter({ alert in !self.alerts.contains( where: {$0.id == alert.id })})
                self.alerts.append(contentsOf: newAlerts)
                self.stillLoading = !response.last
                self.tableView.reloadData()
            }
        }
    }
}
