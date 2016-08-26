//
//  GSBTableViewCell.swift
//  CPWGSB
//
//  Created by Peter Spitzer on 07/08/2016.
//  Copyright © 2016 Spitzer IT. All rights reserved.
//

import UIKit
import pop

class GSBTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bandLabel: UILabel!
    @IBOutlet weak var quantityCounterLabel: UILabel!
    @IBOutlet weak var minusOutlet: UIButton!
    @IBOutlet weak var plusOutlet: UIButton!
    let quantityMin = 0
    let quantityMax = 99
    let helperMethods = HelperMethods()
    
    
    
    @IBAction func quantityAction(sender: AnyObject) {
        let button = sender as! UIButton
        let buttonRow = button.tag
        
            if sender.currentTitle == "+" {
                let newValue = bands[buttonRow].quantity + 1
                if newValue <= quantityMax {
                    quantityCounterLabel.text = "\(newValue)"
                    bands[buttonRow].quantity = newValue
                }
            } else {
                let newValue = bands[buttonRow].quantity - 1
                if newValue >= quantityMin {
                    quantityCounterLabel.text = "\(newValue)"
                    bands[buttonRow].quantity = newValue
                }
            }
            ViewController().tableView.reloadData()
            helperMethods.popAnimateProperty(quantityCounterLabel)
        
        
    
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   

}
