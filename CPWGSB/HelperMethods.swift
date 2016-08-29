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
    
    func popAnimateProperty(property: AnyObject){
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
        springAnimation.toValue = NSValue(CGPoint: CGPointMake(0.9, 0.9))
        springAnimation.velocity = NSValue(CGPoint: CGPointMake(20, 20))
        springAnimation.springBounciness = 10.0
        property.pop_addAnimation(springAnimation, forKey: "springAnimation")
    }
    
    func deleteDataFromEntity(entity: String) {
        // fetch all items in entity and request to delete them
        let fetchRequest = NSFetchRequest(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        // delegate objects
        let myManagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let myPersistentStoreCoordinator = (UIApplication.sharedApplication().delegate as! AppDelegate).persistentStoreCoordinator
        
        // perform the delete
        do {
            try myPersistentStoreCoordinator.executeRequest(deleteRequest, withContext: myManagedObjectContext)
        } catch let error as NSError {
            print(error)
        }
    }


}