//
//  CoreDataStack.swift
//  Journal
//
//  Created by krikaz on 5/4/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    // Singleton
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Journal")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
}
