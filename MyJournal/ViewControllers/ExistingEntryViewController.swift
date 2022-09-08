//
//  ExistingEntryViewController.swift
//  MyJournal
//
//  Created by Johan Näsvall on 2022-09-06.
//

import UIKit

class ExistingEntryViewController: UIViewController {

    @IBOutlet weak var lblTible: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var txtContent: UITextView!
    
    var journalEntry: JournalEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let journalEntry = journalEntry {
            lblTible.text = journalEntry.title
            lblDate.text = journalEntry.date
            txtContent.text = journalEntry.content
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
