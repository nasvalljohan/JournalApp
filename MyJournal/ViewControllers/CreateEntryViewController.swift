//
//  CreateEntryViewController.swift
//  MyJournal
//
//  Created by Johan Näsvall on 2022-09-06.
//

import UIKit

class CreateEntryViewController: UIViewController {

    @IBOutlet weak var switchDate: UISwitch!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var txtContent: UITextView!
    
    var journal: Journal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtContent.layer.borderWidth = 1
        txtContent.layer.borderColor = UIColor.brown.cgColor
        txtContent.layer.cornerRadius = 5
        datePicker.isHidden = !switchDate.isOn
    }
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        datePicker.isHidden = !sender.isOn
    }
    
    @IBAction func onSave(_ sender: Any) {
        if let title = txtTitle.text, let journal = journal, let content = txtContent.text{
            if title != "" && content != "" {
                if switchDate.isOn {
                    journal.addEntry(entry: JournalEntry(content: content, date: datePicker.date, title: title))
                } else{
                    journal.addEntry(entry: JournalEntry(content: content, title: title))
                }
                self.navigationController?.popViewController(animated: false)
            }
        }
    }
}
