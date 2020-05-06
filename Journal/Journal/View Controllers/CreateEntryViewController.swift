//
//  CreateEntryViewController.swift
//  Journal
//
//  Created by krikaz on 5/4/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import UIKit

class CreateEntryViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var moodSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.becomeFirstResponder()
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text, !title.isEmpty else { return }
        
        let bodyText = bodyTextView.text
        Entry(title: title, bodyText: bodyText)
        do {
            try CoreDataStack.shared.mainContext.save()
        } catch {
            NSLog("Error saving managed object context: \(error)")
            return
        }
        
        navigationController?.dismiss(animated: true, completion: nil)
    }

}

