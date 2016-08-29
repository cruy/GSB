//
//  GSBCoreData+CoreDataProperties.swift
//  CPWGSB
//
//  Created by Peter Spitzer on 28/08/2016.
//  Copyright © 2016 Spitzer IT. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension GSBCoreData {

    @NSManaged var band: String?
    @NSManaged var id: NSNumber?
    @NSManaged var quantity: NSNumber?

}
