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
    
    func colorWithHexString (_ hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    func popAnimateProperty(_ property: AnyObject){
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
        springAnimation?.toValue = NSValue(cgPoint: CGPoint(x: 0.9, y: 0.9))
        springAnimation?.velocity = NSValue(cgPoint: CGPoint(x: 20, y: 20))
        springAnimation?.springBounciness = 10.0
        property.pop_add(springAnimation, forKey: "springAnimation")
    }
    
    func deleteDataFromEntity(_ entity: String) {
        // fetch all items in entity and request to delete them
        let fetchRequest = NSFetchRequest(entityName: entity)
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
