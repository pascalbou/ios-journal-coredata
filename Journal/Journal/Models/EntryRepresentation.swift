//
//  EntryRepresentation.swift
//  Journal
//
//  Created by krikaz on 5/6/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import Foundation

struct EntryRepresentation: Codable {
    var identifier: String
    var title: String
    var bodyText: String?
    var timestamp: String
    var mood: String
}
