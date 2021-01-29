//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray =  ["Find Mike", "Buy Eggos", "Destroy Demogorgon"] // let is immutable. So used var

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    // return the number of rows in the table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    // create cell for each row and add text to it
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        cell.accessoryType = .none // deselect everything in the beginning
        
        return cell
        
    }
    
    
    // Action for when user selects a row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // tableView.cellForRow(at: indexPath) is a reference for cell at indexPath
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
            
    }
    
    
    //MARK - Add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            // the following code will execute once the user clicks on the add item button in UIAlert
            print("Success")
            
            self.itemArray.append(textField.text!) // self because this is in a closure
            self.tableView.reloadData() // reload the table view. Also considers the data which was recently added to the array
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item" // this is executed when the user clicks on the "+" button. So, it won't be able to store the data which the user has entered in the textfield. To solve this issue, I created textField and set it equal to the alertTextField. Now when the user clicks on add new item button, the trailing closure written above will be executed and we can reference textField to get the data that the user entered
            textField = alertTextField
        }
        
        alert.addAction(action) // added the action to alert
        
        present(alert, animated: true, completion: nil) // show the alert
        
    }
    

}

