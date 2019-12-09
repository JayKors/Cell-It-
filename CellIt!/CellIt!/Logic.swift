//
//  Logic.swift
//  CellIt!
//
//  Created by Jay Kors on 12/5/19.
//  Copyright © 2019 Jay Kors. All rights reserved.
//

import UIKit

class Logic {
    
    //Get total anticipated revenue of all devices purchased in for sale inventory
    func totalForSaleRevenue(Array: [Array<String>]) -> Double {
        if Array.count != 0 {
            var totalInventoryRevenue: Double = 0
            for i in 0...(Array.count-1) {
                let sellPrice: Double = Double(Array[i][10])!
                totalInventoryRevenue += sellPrice
            }
            return totalInventoryRevenue
        } else {
            return 0
        }
    }
    
    //Get total cost of all devices purchased in for sale inventory
    func totalForSaleCost(Array: [Array<String>]) -> Double {
        if Array.count != 0 {
            var totalInventoryCost: Double = 0
            for i in 0...(Array.count-1) {
                let purchasePrice: Double = Double(Array[i][9])!
                totalInventoryCost += purchasePrice
            }
            return totalInventoryCost
        } else {
            return 0
        }
    }
    
    //Get total anticipated profit of all devices purchased in for sale inventory
    func totalForSaleProfit(Array: [Array<String>]) -> Double {
        if Array.count != 0 {
            let forSaleCost = self.totalForSaleCost(Array: Array)
            let forSaleRevenue = self.totalForSaleRevenue(Array: Array)
            let forSaleProfit = forSaleRevenue-forSaleCost
            
            return forSaleProfit
        } else {
            return 0
        }
    }
    
    //Get total anticipated profit of all devices purchased in for sale inventory
    func forSalePercentProfit(Array: [Array<String>]) -> Double {
        if Array.count != 0 {
            let forSaleProfit = totalForSaleProfit(Array: Array)
            let forSaleRevenue = totalForSaleRevenue(Array: Array)
            let percentProfit = (forSaleProfit/forSaleRevenue)*100
            
            print(forSaleProfit)
            print(forSaleRevenue)
            print(percentProfit)
            
            return percentProfit
        } else {
            return 0
        }
    }
    
    /**************** In Progress ********************/
    func handleUserDefaults(command: String, array: [Array<String>], string: String) -> Any? {
        if command == "set" {
            UserDefaults.standard.set(array, forKey: string)
            return "Success"
        } else if command == "get" {
            return "Success"
        } else if command == "remove" {
            return "Success"
        }
        return "Success"
    }
}
