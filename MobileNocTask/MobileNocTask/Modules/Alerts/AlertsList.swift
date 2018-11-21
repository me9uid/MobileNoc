//
//  AlertsList.swift
//  MobileNocTask
//
//  Created by Ahmed Meguid on 11/21/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit

protocol AlertsListProtocol {
    func update(alerts: [Alert])
}

class AlertsList: UITableViewController {

    private var alerts: [Alert] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib.init(nibName: "AlertCell", bundle: nil),
                                forCellReuseIdentifier: "AlertCell")
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alerts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlertCell", for: indexPath) as! AlertCell
        cell.configure(alert: alerts[indexPath.row])
        return cell
    }
}

extension AlertsList: AlertsListProtocol {
    func update(alerts: [Alert]) {
        self.alerts = alerts
        self.tableView.reloadData()
    }
}
