//
//  DeviceForSaleCell.swift
//  CellIt!
//
//  Created by Jay Kors on 12/7/19.
//  Copyright © 2019 Jay Kors. All rights reserved.
//

import UIKit

class DeviceForSaleCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLabels(description: String){
        descriptionLabel.text = description
    }

}
