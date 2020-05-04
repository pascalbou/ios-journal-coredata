//
//  EntryTableViewCell.swift
//  Journal
//
//  Created by krikaz on 5/4/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "EntryCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var bodyTextLabel: UILabel!
    
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let entry = entry, let timestamp = entry.timestamp else { return }
        
        let df = DateFormatter()
        df.dateFormat = "MM/dd/yy, h:mm a"
        
        titleLabel.text = entry.title
        timestampLabel.text = df.string(from: timestamp)
        bodyTextLabel.text = entry.bodyText
        
    }

}
