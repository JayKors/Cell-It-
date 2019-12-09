//
//  CurrentRevenueCell.swift
//  CellIt!
//
//  Created by Jay Kors on 12/2/19.
//  Copyright © 2019 Jay Kors. All rights reserved.
//

import UIKit

class CurrentRevenueCell: UITableViewCell {

    @IBOutlet weak var currentRevenueLabel: UILabel!
        
    @IBOutlet weak var currentRevenueValue: UILabel!
    
    func setLabels(title: String, value: String){
        currentRevenueLabel.text = title
        currentRevenueValue.text = value
    }
}
