//
//  Entry+Convenience.swift
//  Journal
//
//  Created by krikaz on 5/4/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import Foundation
import CoreData

enum Mood: String, CaseIterable {
    case happy
    case sad
    case neutral
}

extension Entry {
    
    var entryRepresentation: EntryRepresentation? {
        guard let id = identifier, let title = title, let timestamp = timestamp, let mood = mood else { return nil }
        
        let df = DateFormatter()
        let timestampString = df.string(from: timestamp)
        
        return EntryRepresentation(identifier: id, title: title, bodyText: bodyText, timestamp: timestampString, mood: mood)
    }
    
    @discardableResult convenience init (identifier: String = UUID().uuidString,
                        title: String,
                        bodyText: String?,
                        timestamp: Date = Date(),
                        mood: Mood = .neutral,
                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.identifier = identifier
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timestamp
        self.mood = mood.rawValue
        
    }
}
