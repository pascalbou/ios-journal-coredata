//
//  Entry+Convenience.swift
//  Journal
//
//  Created by krikaz on 5/4/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    @discardableResult convenience init (identifier: String = UUID().uuidString,
                        title: String,
                        bodyText: String?,
                        timestamp: Date = Date(),
                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.identifier = identifier
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timestamp
        
    }
}
