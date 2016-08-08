//
//  GSBTableViewCell.swift
//  CPWGSB
//
//  Created by Peter Spitzer on 07/08/2016.
//  Copyright © 2016 Spitzer IT. All rights reserved.
//

import UIKit

class GSBTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bandLabel: UILabel!
    @IBOutlet weak var quantityCounterLabel: UILabel!
    @IBOutlet weak var minusOutlet: UIButton!
    @IBOutlet weak var plusOutlet: UIButton!
    let buttonMin = 0
    let buttonMax = 20
    
    @IBAction func minusAction(sender: UIButton) {
        let buttonRow = sender.tag
        let newValue = bands[buttonRow].quantity - 1
        
        if newValue >= buttonMin {
        quantityCounterLabel.text = "\(newValue)"
        bands[buttonRow].quantity = newValue
            
        ViewController().tableView.reloadData()
        }
        
        
    }
    @IBAction func plusAction(sender: UIButton) {
        let buttonRow = sender.tag
        let newValue = bands[buttonRow].quantity + 1
        
        if newValue <= buttonMax {
        quantityCounterLabel.text = "\(newValue)"
        bands[buttonRow].quantity = newValue
        
        ViewController().tableView.reloadData()
        }
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
