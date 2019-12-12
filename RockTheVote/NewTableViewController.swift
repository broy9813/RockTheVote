//
//  NewTableViewController.swift
//  RockTheVote
//
//  Created by Roy, Bishakha on 12/12/19.
//  Copyright © 2019 Roy, Bishakha. All rights reserved.
//

import UIKit
import CoreData

class NewTableViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var rockthevote = ["songTitle", "voterName", "vote"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 84.0
        loadrockthevote()
    }

    func loadrockthevote() {
        
        // create an instance of a FetchRequest so that
        // data may be fetched from the Student entity
        let request: NSFetchRequest<rockthevote> = rockthevote.fetchRequest()
        
        do {
            // use context to execute fetch request
            // and store fetched students in array
            // fetch method could throw an error, so
            // it must be included in a do-catch
            rockthevote = try context.fetch(request)
        } catch {
            print("Error fetching voting data from context \(error)")
        }
        
        // reload fetched data in Table View Controller
        tableView.reloadData()
    }
    
    // save Student data to Core Data
    func saverockthevote (){
        do {
            // use context to execute save request
            // save method could throw an error, so
            // it must be included in a do-catch
            try context.save()
        } catch {
            print("Error saving student \(error)")
        }
        
        // reload data in Table View Controller
        tableView.reloadData()
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rockthevote.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RockTheVoteCell", for: indexPath)

        // Configure the cell...
       cell.textLabel?.text = rockthevote.songTitle!
        cell.detailTextLabel!.numberOfLines = 0
        cell.detailTextLabel?.text = rockthevote.voterName! + "\n" + rockthevote.vote!
        return cell
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        // declare Text Fields for the input of the song title, voter name, vote
               var songTitleTextField = UITextField()
               var voterNameTextField = UITextField()
               var voteTextField = UITextField()
              
               // create an Alert Controller
               let alert = UIAlertController(title: "My Vote", message: "", preferredStyle: .alert)
                   
               // define action that will occur when Alert
               // Controller's add button is pushed
               let action = UIAlertAction(title: "Add", style: .default, handler: { (action) in
                       
                   // create an instance of a Student
                   let newrockthevote = rockthevote(context: self.context)
                       
                   // get first name, last name, year, and major input by user and store them in Student
                   newrockthevote.songTitle = songTitleTextField.text!
                   newrockthevote.voterName = voterNameTextField.text!
                   newrockthevote.vote = Boolean(voteTextField.text!)!

                       
                   // add Student into array
                   self.rockthevote.append(newrockthevote)
                       
                   // save array
                   self.saverockthevote()
               })
                   
               // disable the action that allows the user to add a Student
               action.isEnabled = false
                   
               // define action that will occur when Alert
               // Controller's cancel button is pushed
               let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (cancelAction) in
                       
               })
                   
               // add the actions to the Alert Controller
               alert.addAction(action)
               alert.addAction(cancelAction)
                   
               // display the Alert Controller
               present(alert, animated: true, completion: nil)
           }
               
           }
           
           override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               // dequeing the table row cell
               _ = tableView.dequeueReusableCell(withIdentifier: "RockTheVoteCell", for: indexPath)
               
               // create 4 text fields
               var songTitleTextField = UITextField()
               var voterNameField = UITextField()
               var voteField = UITextField()
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
