//
//  MainViewController.swift
//  CellIt!
//
//  Created by Jay Kors on 11/24/19.
//  Copyright © 2019 Jay Kors. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let defaults = UserDefaults.standard    //Sets up userdefaults for storing data after app closure
    var fieldsArrayText: [Array<String>] = []         //Array used to store texts of fields entered

    override func viewDidLoad() {
        super.viewDidLoad()
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
        }
    }
    
    //Get data from userdefaults before view loads
    override func viewDidAppear(_ animated: Bool) {
        print("Here in Main Controller")
        fieldsArrayText = getUserDefaults()
        //print(Array(UserDefaults.standard.dictionaryRepresentation()))
    }
    
    func getUserDefaults() -> [Array<String>] {
        if UserDefaults.standard.array(forKey: "fields") != nil {
            fieldsArrayText = UserDefaults.standard.array(forKey: "fields")! as! [Array<String>]
            print("Previous Defaults Found")
            print(fieldsArrayText)
        } else {
            print("No Previous Defaults Found")
            fieldsArrayText = []
        }
        
        return fieldsArrayText
    }
    
    @IBAction func unwindToMainView(unwindSegue: UIStoryboardSegue) {}
    
    @IBAction func salesSummaryButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "MainToSales", sender: fieldsArrayText)
    }
    
    @IBAction func purchaseDeviceButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "MainToPurchase", sender: fieldsArrayText)
    }
    
    @IBAction func devicesForSaleButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "MainToDevices", sender: fieldsArrayText)
    }
}



