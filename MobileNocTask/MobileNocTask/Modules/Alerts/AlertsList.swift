//
//  AlertsList.swift
//  MobileNocTask
//
//  Created by Ahmed Meguid on 11/21/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit

class AlertsList: UITableViewController {
    
    let dataSource: AlertsDataSource = AlertsDataSourceImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: "AlertCell", bundle: nil), forCellReuseIdentifier: "AlertCell")
        dataSource.data.bindAndFire { (_) in self.tableView.reloadData()}
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.data.value.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlertCell", for: indexPath) as! AlertCell
        cell.configure(alert: dataSource.data.value[indexPath.row])
        return cell
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if tableView.contentOffset.y > (tableView.contentSize.height - tableView.frame.size.height) + 5 {
            dataSource.update()
        }
    }
}
