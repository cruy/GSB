//
//  ViewController.swift
//  CPWGSB
//
//  Created by Peter Spitzer on 06/08/2016.
//  Copyright © 2016 Spitzer IT. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var totalGSB: Double = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        tableView.separatorStyle = .None
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
        cell.bandLabel.textColor = colorWithHexString(bands[indexPath.row].fontColorHex)
        cell.quantityCounterLabel.text = "\(bands[indexPath.row].quantity)"
        cell.quantityCounterLabel.textColor = colorWithHexString(bands[indexPath.row].fontColorHex)
        cell.minusOutlet.tag = indexPath.row
        cell.plusOutlet.tag = indexPath.row
        cell.backgroundColor = colorWithHexString(bands[indexPath.row].colorHex)
        
        

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
            
            var subTotalGSB: Double = 0
            
            for index in 0...bands.count-1 {
                let tempGSB = (Double(bands[index].quantity) * bands[index].reward)
                subTotalGSB += tempGSB
            }
            
            let destinationVC = segue.destinationViewController as! ResultViewController
            destinationVC.result = subTotalGSB
            
        }
    }
    
    func colorWithHexString (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substringFromIndex(1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.grayColor()
        }
        
        let rString = (cString as NSString).substringToIndex(2)
        let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }


}

