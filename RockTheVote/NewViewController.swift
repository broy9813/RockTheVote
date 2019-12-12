//
//  NewViewController.swift
//  RockTheVote
//
//  Created by Roy, Bishakha on 12/12/19.
//  Copyright © 2019 Roy, Bishakha. All rights reserved.
//

import UIKit
import CoreData

class NewViewController: UIViewController {

    var likeSong = ""
    var dislikeSong = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var songTextField: UITextField!
    
    @IBOutlet weak var voterTextField: UITextField!
    
    
    
    // MARK: - Navigation
     

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "rockthevote") {
            
            // get the index path for the row that was selected
            // (0, 0), (0, 1), (0, 2), etc.
            let selectedRowIndex = self.tableView.indexPathForSelectedRow
            
            // create an instance of the Shopping List Table View Controller
            let shoppingListItem = segue.destination as! NewTableViewController
            
            // set the selected shoping list property of the Shopping List Table View Controller equal to the row of the index path
            shoppingListItem.selectedShoppingList = rockthvote[selectedRowIndex!.row]

    }
    }
}

    @IBAction func likeSong(_ sender: UIButton) {
        
        var like = 0.0
    }
    
    
    @IBAction func dislikeSong(_ sender: UIButton) {
        
        var dislike = 0.0
    }
}
