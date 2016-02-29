//
//  Anottation.swift
//  noeAPP
//
//  Created by Henrique on 24/02/16.
//  Copyright © 2016 Henrique. All rights reserved.
//

import Foundation
import CoreData


class Anottation: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    static let entityName = "Anottation"
    
    static func findAllInContext(managedObjectContext: NSManagedObjectContext) -> [Anottation]{
        
        let fetchRequest = NSFetchRequest(entityName: entityName)
        let anottations = try! managedObjectContext.executeFetchRequest(fetchRequest)
        
        return anottations as! [Anottation]
    }
    
    
    convenience init(managedObjectContext: NSManagedObjectContext){
        let entitiyDescription = NSEntityDescription.entityForName(Anottation.entityName, inManagedObjectContext: managedObjectContext)!
        self.init(entity: entitiyDescription, insertIntoManagedObjectContext: managedObjectContext)
    }
    
    func save(managedObjectContext: NSManagedObjectContext) throws {
        try managedObjectContext.save()
    }
    
    
 }
