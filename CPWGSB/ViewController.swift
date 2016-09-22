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
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        tableView.separatorStyle = .none
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetch()
        print("fetched withing viewWillAppear method, fetched")
        
                
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bands.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! GSBTableViewCell
        
        cell.selectionStyle = .none
        cell.bandLabel.text = "Band \(bands[(indexPath as NSIndexPath).row].band)"
        cell.bandLabel.textColor = helperMethods.colorWithHexString(colors[(indexPath as NSIndexPath).row].fontColorHex)
        cell.quantityCounterLabel.text = "\(bands[(indexPath as NSIndexPath).row].quantity)"
        cell.quantityCounterLabel.textColor = helperMethods.colorWithHexString(colors[(indexPath as NSIndexPath).row].fontColorHex)
        cell.minusOutlet.tag = (indexPath as NSIndexPath).row
        cell.plusOutlet.tag = (indexPath as NSIndexPath).row
        cell.backgroundColor = helperMethods.colorWithHexString(colors[(indexPath as NSIndexPath).row].colorHex)
        
        return cell
    }
    
    @IBAction func resetAction(_ sender: UIBarButtonItem) {
//        undoManager?.registerUndoWithTarget(self, selector: #selector(ViewController.undoBands), object: bands)
        
        for index in 0...bands.count-1 {
            bands[index].quantity = 0
        }
        
        helperMethods.deleteDataFromEntity("GSBCoreData")
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            
            save(bands)
            print("saved within prepareForSegue method, saved")
            
            var totalGSB: Double = 0
            for index in 0...bands.count-1 {
                let tempGSB = (Double(bands[index].quantity) * bands[index].reward)
                totalGSB += tempGSB
            }
            
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = totalGSB
            
        }
    }
    
    // MARK: - Core Data save
    
    func save(_ itemsToSave: [GSB]) {
        
        helperMethods.deleteDataFromEntity("GSBCoreData")
        
        let myManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        
        let entity = NSEntityDescription.entity(forEntityName: "GSBCoreData", in: myManagedObjectContext)
        
        for itemToSave in itemsToSave {
            
            let item = NSManagedObject(entity: entity!, insertInto: myManagedObjectContext)
            
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
        
      let myManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        
        let request = NSFetchRequest(entityName: "GSBCoreData")
        
        do {

            let results = try myManagedObjectContext.fetch(request) as! [NSManagedObject]
            
            for result in results {
                let quantity = result.value(forKey: "quantity") as! Int
                let id = result.value(forKey: "id") as! Int
                
                for index in 0..<bands.count {
                    if bands[index].id == id {
                        bands[index].quantity = quantity
                    }
                }
                    
            }
          
        } catch let err {
            print(err)
        }
        
        self.tableView.reloadData()
        
    } // end of fetch method
    

}

