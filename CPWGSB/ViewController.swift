//
//  ViewController.swift
//  CPWGSB
//
//  Created by Peter Spitzer on 06/08/2016.
//  Copyright © 2016 Spitzer IT. All rights reserved.
//

import UIKit


class ViewController: UITableViewController {
    
    var helperMethods = HelperMethods()
    var totalGSB: Double = 0
    var gsbTableViewCell = GSBTableViewCell()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        tableView.separatorStyle = .None
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bands.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! GSBTableViewCell
        
        cell.selectionStyle = .None
        cell.bandLabel.text = "Band \(bands[indexPath.row].band)"
        cell.bandLabel.textColor = helperMethods.colorWithHexString(bands[indexPath.row].fontColorHex)
        cell.quantityCounterLabel.text = "\(bands[indexPath.row].quantity)"
        cell.quantityCounterLabel.textColor = helperMethods.colorWithHexString(bands[indexPath.row].fontColorHex)
        cell.minusOutlet.tag = indexPath.row
        cell.plusOutlet.tag = indexPath.row
        cell.backgroundColor = helperMethods.colorWithHexString(bands[indexPath.row].colorHex)
        
        return cell
    }
    
    @IBAction func resetAction(sender: UIBarButtonItem) {
        for index in 0...bands.count-1 {
            bands[index].quantity = 0
        }
        
        self.tableView.reloadData()
    }
    
    @IBAction func calculateAction(sender: UIBarButtonItem) {
            }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "resultSegue" {
            
            var totalGSB: Double = 0
            for index in 0...bands.count-1 {
                let tempGSB = (Double(bands[index].quantity) * bands[index].reward)
                totalGSB += tempGSB
            }
            
            let destinationVC = segue.destinationViewController as! ResultViewController
            destinationVC.result = totalGSB
            
        }
    }
    
    

}

