//
//  Anottation+CoreDataProperties.swift
//  noeAPP
//
//  Created by Henrique on 24/02/16.
//  Copyright © 2016 Henrique. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Anottation {

    @NSManaged var author: String?
    @NSManaged var subject: String?
    @NSManaged var date: String?
    @NSManaged var ponderation: String?

}
