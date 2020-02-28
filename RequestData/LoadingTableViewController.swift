//
//  TestDummyApiViewController.swift
//  RequestData
//
//  Created by Keapheng on 2/25/20.
//  Copyright © 2020 Keapheng. All rights reserved.
//

import UIKit

class LoadingTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let employeePresenter = EmployeePresenter()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cell = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: "tableCell")
        tableView.dataSource = self
        tableView.delegate = self
        

        tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(requestNewData), for: .allEvents)
        
//        employeePresenter.getData(completion: {
//            self.tableView.reloadData()
//        })
    }
    
    @objc func requestNewData() {
        employeePresenter.getData {
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        }
    }
}

extension LoadingTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeePresenter.employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        
        cell.lblID.text = employeePresenter.employees[indexPath.row].id
        cell.lblName.text = employeePresenter.employees[indexPath.row].employee_name
        cell.lblAge.text = employeePresenter.employees[indexPath.row].employee_age
        cell.lblSalary.text = employeePresenter.employees[indexPath.row].employee_salary
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
}
