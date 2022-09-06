//
//  JournalTableViewController.swift
//  MyJournal
//
//  Created by Johan Näsvall on 2022-09-06.
//

import UIKit

class JournalTableViewController: UITableViewController {
    
    var JournalCell = "JournalCell"
    
    var journal = Journal()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        journal.addEntry(entry: JournalEntry(content: "Contents", title: "Title"))
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
            content.text = "\(entry.content) \(entry.date)"
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

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
