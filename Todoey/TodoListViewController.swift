//
//  ViewController.swift
//  Todoey
//
//  Created by Michael Garden on 28/05/18.
//  Copyright © 2018 Michael Garden. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Find Mike", "Buy Eggs", "Destroy Demogorgon"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    //MARK - Tableview DataSource Methods
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
        
    }
    

    //MARK TableView Delegate Methods for when a row is selected
    
    
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        
        else {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    
    
        tableView.deselectRow(at: indexPath, animated: true)
    
        
        
        
    }
    
    
    
    
    
    
}

