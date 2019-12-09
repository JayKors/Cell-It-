//
//  PurchaseDeviceViewController.swift
//  CellIt!
//
//  Created by Jay Kors on 12/5/19.
//  Copyright © 2019 Jay Kors. All rights reserved.
//

import UIKit

class PurchaseDeviceViewController: UIViewController {

    @IBOutlet weak var statusField: UITextField!
    @IBOutlet weak var deviceTypeField: UITextField!
    @IBOutlet weak var manufacturerField: UITextField!
    @IBOutlet weak var modelField: UITextField!
    @IBOutlet weak var carrierField: UITextField!
    @IBOutlet weak var storageCapacityField: UITextField!
    @IBOutlet weak var colorField: UITextField!
    @IBOutlet weak var uidField: UITextField!
    @IBOutlet weak var purchasePriceField: UITextField!
    @IBOutlet weak var sellPriceField: UITextField!
    
    var oldFieldsArray: [Array<String>] = []
    
    var fieldsArray: [UITextField] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fieldsArray = [statusField!, deviceTypeField!, manufacturerField!, modelField!, carrierField!, storageCapacityField!, colorField!, uidField!, purchasePriceField!, sellPriceField!]

        for i in 0...(fieldsArray.count-1){
            print(fieldsArray[i].text!)
        }
    }
    
        //Get data from userdefaults before view appears
    override func viewDidAppear(_ animated: Bool) {
        print("Here in Purchase Device Controller")
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        var fieldsArrayText: [String] = []
        
        for i in 0...(fieldsArray.count-1){
            fieldsArrayText.append(fieldsArray[i].text!)
            fieldsArray[i].resignFirstResponder()
            fieldsArray[i].text = "Saved!"
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {       //Run specified code after short delay
            for i in 0...(self.fieldsArray.count-1){
                self.fieldsArray[i].text = nil
            }
        }
        fieldsArrayText.insert(currentDate(), at: 0)
        oldFieldsArray.insert(fieldsArrayText, at: 0)               //Add latest caputered field entry (array) to previous entries                                                                                  (Array<Array>) at index 0
        UserDefaults.standard.set(oldFieldsArray, forKey: "fields") //Save data to UserDefaults in previous array if exists
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for i in 0...(fieldsArray.count-1){
            fieldsArray[i].resignFirstResponder()
        }
    }
    
    
    func currentDate() -> String {
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        return "\(year)-\(month)-\(day)"
    }
}

extension PurchaseDeviceViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
