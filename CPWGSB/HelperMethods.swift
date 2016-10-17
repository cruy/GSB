//
//  HelperMethods.swift
//  CPWGSB
//
//  Created by Peter Spitzer on 19/08/2016.
//  Copyright © 2016 Spitzer IT. All rights reserved.
//

//import Foundation
import UIKit
import pop
import CoreData

class HelperMethods {
    
    func popAnimateProperty(_ property: AnyObject){
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
        springAnimation?.toValue = NSValue(cgPoint: CGPoint(x: 0.9, y: 0.9))
        springAnimation?.velocity = NSValue(cgPoint: CGPoint(x: 20, y: 20))
        springAnimation?.springBounciness = 10.0
        property.pop_add(springAnimation, forKey: "springAnimation")
    }
    
    func deleteDataFromEntity(_ entity: String) {
        // fetch all items in entity and request to delete them
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        // delegate objects
        let myManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        let myPersistentStoreCoordinator = (UIApplication.shared.delegate as! AppDelegate).persistentStoreCoordinator
        
        // perform the delete
        do {
            try myPersistentStoreCoordinator.execute(deleteRequest, with: myManagedObjectContext)
        } catch let error as NSError {
            print(error)
        }
    }


}
