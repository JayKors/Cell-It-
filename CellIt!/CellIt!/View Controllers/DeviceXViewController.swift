//
//  PurchaseDeviceViewController.swift
//  CellIt!
//
//  Created by Jay Kors on 12/5/19.
//  Copyright © 2019 Jay Kors. All rights reserved.
//

import UIKit

class DeviceXViewController: UIViewController {

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
    @IBOutlet weak var navBarLabel: UINavigationItem!
    
    var oldFieldsArray: [Array<String>] = []
    var fieldsArray: [UITextField] = []
    var rowTapped: Int = 0
    let mainView = MainViewController()
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        fieldsArray = [statusField!, deviceTypeField!, manufacturerField!, modelField!, carrierField!, storageCapacityField!, colorField!, uidField!, purchasePriceField!, sellPriceField!]

        oldFieldsArray = mainView.getUserDefaults()
        
        setLabels(newFieldsArray: oldFieldsArray[rowTapped])
    }
    
        //Get data from userdefaults before view appears
    override func viewDidAppear(_ animated: Bool) {
        print("Here in Purchase Device Controller")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for i in 0...(fieldsArray.count-1){
            fieldsArray[i].resignFirstResponder()
        }
    }
    
    func setLabels(newFieldsArray: [String]) {
        navBarLabel.title = newFieldsArray[4]
        for i in 1...(fieldsArray.count){
            fieldsArray[i-1].text = newFieldsArray[i]
        }
    }
    
    @IBAction func updateButtonTapped(_ sender: Any) {
        
        var fieldsArrayText: [String] = []
        let date = oldFieldsArray[rowTapped][0]
        
        print("Before: \(oldFieldsArray[rowTapped])")
        
        for i in 0...(fieldsArray.count-1){
            fieldsArrayText.append(fieldsArray[i].text!)
            fieldsArray[i].resignFirstResponder()
            fieldsArray[i].text = "Updated!"
        }
        navBarLabel.title = fieldsArrayText[3]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {       //Run specified code after short delay
            for i in 0...(self.fieldsArray.count-1){
                self.fieldsArray[i].text = fieldsArrayText[i+1]
            }
        }
        fieldsArrayText.insert(date, at: 0)
        oldFieldsArray.remove(at: rowTapped)
        oldFieldsArray.insert(fieldsArrayText, at: rowTapped)

        UserDefaults.standard.set(oldFieldsArray, forKey: "fields") //Save data to UserDefaults in previous array if exists
        print("After: \(oldFieldsArray[rowTapped])")
    }
    
    @IBAction func markSoldButtonPressed(_ sender: Any) {
        let soldField = oldFieldsArray[rowTapped]
        print(soldField)
        oldFieldsArray.remove(at: rowTapped)
        UserDefaults.standard.set(oldFieldsArray, forKey: "fields") //Save data to UserDefaults in previous array if exists
        print(soldField)
        print("Hello")
    }
    
}

extension DeviceXViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
