//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by krikaz on 5/6/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var moodSegmentedControl: UISegmentedControl!
    
    var entry: Entry?
    var wasEdited = false
    var entryController: EntryController?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = editButtonItem
        updateViews()
    }
    
    private func updateViews() {
        titleTextField.text = entry?.title
        titleTextField.isUserInteractionEnabled = isEditing
        
        bodyTextView.text = entry?.bodyText
        bodyTextView.isUserInteractionEnabled = isEditing
        
        let mood: Mood
        if let entryMood = entry?.mood {
            mood = Mood(rawValue: entryMood)!
        } else {
            mood = .neutral
        }
        
        moodSegmentedControl.selectedSegmentIndex = Mood.allCases.firstIndex(of: mood) ?? 2
        moodSegmentedControl.isUserInteractionEnabled = isEditing
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if editing {
            wasEdited = true
            titleTextField.isUserInteractionEnabled = editing
            bodyTextView.isUserInteractionEnabled = editing
            moodSegmentedControl.isUserInteractionEnabled = editing
            navigationItem.hidesBackButton = editing
        } else {
            titleTextField.isUserInteractionEnabled = editing
            bodyTextView.isUserInteractionEnabled = editing
            moodSegmentedControl.isUserInteractionEnabled = editing
            navigationItem.hidesBackButton = editing
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if wasEdited {
            guard let title = titleTextField.text, !title.isEmpty else { return }
            let bodyText = bodyTextView.text
            let moodIndex = moodSegmentedControl.selectedSegmentIndex
            let mood = Mood.allCases[moodIndex].rawValue
                        
            entry?.setValue(title, forKey: "title")
            entry?.setValue(bodyText, forKey: "bodyText")
            entry?.setValue(mood, forKey: "mood")
            
            if let entry = entry {
                entryController?.sendEntryToServer(entry: entry)
            }
            
            
            do {
                try CoreDataStack.shared.mainContext.save()
            } catch {
                NSLog("Error saving managed object context: \(error)")
                return
            }
        }
    }
    


}
