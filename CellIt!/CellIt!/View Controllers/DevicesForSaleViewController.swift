//
//  DevicesForSaleViewController.swift
//  CellIt!
//
//  Created by Jay Kors on 12/7/19.
//  Copyright © 2019 Jay Kors. All rights reserved.
//

import UIKit

class DevicesForSaleViewController: UIViewController {
    
    @IBOutlet weak var forSaleTableView: UITableView!
    
    let deviceXController = DeviceXViewController()
    let mainView = MainViewController()
    
    var oldFieldsArray: Array<Any?> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        forSaleTableView.delegate = self
        forSaleTableView.dataSource = self
    }
    
        //Get data from userdefaults before view appears
    override func viewDidAppear(_ animated: Bool) {
        print("Here in Devices For Sale Controller")
    }
    
    @IBAction func clearListButtonTapped(_ sender: Any) {
        clearUserDefaults()
        oldFieldsArray.removeAll()
        forSaleTableView.reloadData()
    }
    
    func clearUserDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
        defaults.removeObject(forKey: "fields")
        }
        defaults.synchronize()
        print("Defaults Cleared")
        //print(Array(UserDefaults.standard.dictionaryRepresentation()))
    }
    
    @IBAction func unwindToDevicesForSaleView(unwindSegue: UIStoryboardSegue) {
        print("Here Jay")
        oldFieldsArray = mainView.getUserDefaults()
        forSaleTableView.reloadData()
    }
    
    
    //Prepare destination to receive data through segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToSummary" {
            let destVC = segue.destination as! SalesSummaryViewController
            //destVC.oldFieldsArray = sender as! [Array<String>]
        } else if segue.identifier == "MainToPurchase" {
                let destVC = segue.destination as! PurchaseDeviceViewController
            destVC.oldFieldsArray = sender as! [Array<String>]
        } else if segue.identifier == "MainToDevices" {
                let destVC = segue.destination as! DevicesForSaleViewController
                destVC.oldFieldsArray = sender as! Array<Any?>
        } else if segue.identifier == "DevicesForSaleToDeviceX" {
            let destVC = segue.destination as! DeviceXViewController
            destVC.rowTapped = sender as! Int
        }
    }
}

extension DevicesForSaleViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oldFieldsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let description = oldFieldsArray as? [Array<String>] {
            print(description[indexPath.row])
            let device = description[indexPath.row][4]
            let carrier = description[indexPath.row][5]
            let storage = description[indexPath.row][6]
            let sellPrice = description[indexPath.row][10]
            let labelText = "\(device)  |  \(carrier)  |  \(storage)  |  $\(sellPrice)"
            let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceForSale") as! DeviceForSaleCell
            cell.setLabels(description: labelText)
        
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceForSale") as! DeviceForSaleCell
            cell.setLabels(description: "Fail")
        
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let fieldsArray = oldFieldsArray as? [Array<String>] {
            let rowTappedData = fieldsArray[indexPath.row]
            //print("1: \(fieldsArray[indexPath.row])")
            
            //deviceXController.setLabels(newFieldsArray: rowTappedData)
            performSegue(withIdentifier: "DevicesForSaleToDeviceX", sender: indexPath.row)
        }
    }
}
