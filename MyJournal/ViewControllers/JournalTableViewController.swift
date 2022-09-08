//
//  JournalTableViewController.swift
//  MyJournal
//
//  Created by Johan Näsvall on 2022-09-06.
//

import UIKit

class JournalTableViewController: UITableViewController {
    
    var JournalCell = "JournalCell"
    
    @IBOutlet var myTableView: UITableView!
    var journal = Journal()
    let segueToEntry: String = "segueToEntry"
    let segueToExisting: String = "segueToExisting"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        journal.addEntry(entry: JournalEntry(content: "Contents", title: "Title"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
    }

    // MARK: - Table view data source

    //Bestämmer hur många sektioner
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    //Bestämmet hur många rader. Om man har stöd för flera sektioner kan man skilja dem åt genom "section: Int"
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return journal.getCount()
    }

    //På pickerview bestämmer denna titel, ungefär samma här fast man kan göra mer
    //Vi kan även veta vilken rad som våran cell befinner sig i genom "indexPath: indexPath", funktionen kommer köras en gång för varje cell.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JournalCell, for: indexPath)
        
        //Skapar en instance av contentconfiguration
        var content = cell.defaultContentConfiguration()
        
        //Skapar en config om index inte är null
        if let entry = journal.getEntryAt(index: indexPath.row){
            content.text = "\(entry.date) \(entry.title) "
        }
        
        //Sätter contentconfiguration till den config vi skapat
        cell.contentConfiguration = content

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let remove = UIContextualAction(style: .destructive, title: "Ta bort?", handler: {(action, view, completion) in
            self.journal.removeEntry(index: indexPath.row)
            self.myTableView.deleteRows(at: [indexPath], with: .fade)
        })
        let add = UIContextualAction(style: .normal, title: "Ändra", handler: {(action, view, completion) in
            self.performSegue(withIdentifier: self.segueToExisting, sender: self)
        })
        add.backgroundColor = UIColor.init(red: 0/255, green: 255/255, blue: 0/255, alpha: 1)
        let actions = UISwipeActionsConfiguration(actions: [remove, add])
        
        return actions
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case segueToEntry:
            if let dVC = segue.destination as? CreateEntryViewController {
                dVC.journal = self.journal
            }
             break
        case segueToExisting:
 
            if let dVC = segue.destination as? ExistingEntryViewController,
               let cell = sender as? UITableViewCell,
               let indexPath = myTableView.indexPath(for: cell),
               let entry = journal.getEntryAt(index: indexPath.row){
                dVC.journalEntry = entry
            }
             break
        default: return
        }
    }
}
