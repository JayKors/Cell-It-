//
//  SalesSummaryViewController.swift
//  CellIt!
//
//  Created by Jay Kors on 12/2/19.
//  Copyright © 2019 Jay Kors. All rights reserved.
//

import UIKit

class SalesSummaryViewController: UIViewController{
    
    let mathLogic = Logic()
    let mainView = MainViewController()
    var rowTitles: [String]  = []
    var currentMonthValues: [Double] = []

    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var tableView3: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let oldFieldsArray = mainView.getUserDefaults()
        
        print("Here \(oldFieldsArray)")
        
        //let cost = mathLogic.totalCurrentCost(Array: oldFieldsArray)
        let revenue = mathLogic.totalForSaleRevenue(Array: oldFieldsArray)
        let profit = mathLogic.totalForSaleProfit(Array: oldFieldsArray)
        let percentProfit = mathLogic.forSalePercentProfit(Array: oldFieldsArray)
        
        rowTitles = ["Revenue", "Profit", "% Profit"]
        currentMonthValues = [revenue, profit, percentProfit]
        
        tableView1.delegate = self
        tableView1.dataSource = self
        
        tableView2.delegate = self
        tableView2.dataSource = self
        
        tableView3.delegate = self
        tableView3.dataSource = self
    }
        //Get data from userdefaults before view appears
    override func viewDidAppear(_ animated: Bool) {
        print("Here in Sales Summary Controller")
    }
}

extension SalesSummaryViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = rowTitles[indexPath.row]
        var value: Double
        var valueStr: String

        
        switch tableView{
        case tableView1:
            value = currentMonthValues[indexPath.row]
        case tableView2:
            value = currentMonthValues[indexPath.row]
        case tableView3:
            value = currentMonthValues[indexPath.row]
        default:
            value = 0
        }
                
        if indexPath.row == 2 {
            valueStr = String(format: "%.2f", value) + "%"
        } else {
            valueStr = "$" + String(format: "%.2f", value)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentCell") as! CurrentRevenueCell

        cell.setLabels(title: title, value: valueStr)
    
        return cell
    }
}
