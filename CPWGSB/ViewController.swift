//
//  ViewController.swift
//  CPWGSB
//
//  Created by Peter Spitzer on 06/08/2016.
//  Copyright © 2016 Spitzer IT. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
    
    let helperMethods = HelperMethods()
    var listItems = [NSManagedObject]()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        tableView.separatorStyle = .None
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        fetch()
        print("fetched withing viewWillAppear method, fetched")
        
                
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
        cell.bandLabel.textColor = helperMethods.colorWithHexString(colors[indexPath.row].fontColorHex)
        cell.quantityCounterLabel.text = "\(bands[indexPath.row].quantity)"
        cell.quantityCounterLabel.textColor = helperMethods.colorWithHexString(colors[indexPath.row].fontColorHex)
        cell.minusOutlet.tag = indexPath.row
        cell.plusOutlet.tag = indexPath.row
        cell.backgroundColor = helperMethods.colorWithHexString(colors[indexPath.row].colorHex)
        
        return cell
    }
    
    @IBAction func resetAction(sender: UIBarButtonItem) {
//        undoManager?.registerUndoWithTarget(self, selector: #selector(ViewController.undoBands), object: bands)
        
        for index in 0...bands.count-1 {
            bands[index].quantity = 0
        }
        
        helperMethods.deleteDataFromEntity("GSBCoreData")
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "resultSegue" {
            
            save(bands)
            print("saved within prepareForSegue method, saved")
            
            var totalGSB: Double = 0
            for index in 0...bands.count-1 {
                let tempGSB = (Double(bands[index].quantity) * bands[index].reward)
                totalGSB += tempGSB
            }
            
            let destinationVC = segue.destinationViewController as! ResultViewController
            destinationVC.result = totalGSB
            
        }
    }
    
    // MARK: - Core Data save
    
    func save(itemsToSave: [GSB]) {
        
        helperMethods.deleteDataFromEntity("GSBCoreData")
        
        let myManagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let entity = NSEntityDescription.entityForName("GSBCoreData", inManagedObjectContext: myManagedObjectContext)
        
        for itemToSave in itemsToSave {
            
            let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: myManagedObjectContext)
            
            item.setValue(itemToSave.band, forKey: "band")
            item.setValue(itemToSave.quantity, forKey: "quantity")
            item.setValue(itemToSave.id, forKey: "id")
            
            listItems.append(item)
        } // end of for in loop
        
        do {
            try myManagedObjectContext.save()
        } catch {
            print("error couldn't save core data context")
        }

        
        
    } // end of save method
    
    func fetch() {
        
      let myManagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let request = NSFetchRequest(entityName: "GSBCoreData")
        
        do {

            let results = try myManagedObjectContext.executeFetchRequest(request) as! [NSManagedObject]
            
            for result in results {
                let quantity = result.valueForKey("quantity") as! Int
                let id = result.valueForKey("id") as! Int
                
                for index in 0..<bands.count {
                    if bands[index].id == id {
                        bands[index].quantity = quantity
                    }
                }
                    
                }
          
        } catch {
            print("there was a fetch error")
        }
        
        self.tableView.reloadData()
        
    } // end of fetch method
    
//    func undoBands() {
//        bands = tempBandsForUndo
//        self.tableView.reloadData()
//        
//    }
//    
//    
//    @IBAction func undoAction(sender: AnyObject) {
//       undoManager!.undo()
//    }
    

}

