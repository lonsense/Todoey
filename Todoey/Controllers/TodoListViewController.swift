//
//  ViewController.swift
//  Todoey
//
//  Created by Michael Garden on 28/05/18.
//  Copyright © 2018 Michael Garden. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let newItem1 = Item()
        newItem1.title = "Find Mike"
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "Buy eggs"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Count stars"
        itemArray.append(newItem3)
        
        
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }




    }

    //MARK - Tableview DataSource Methods
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
     

        
        //Ternery operator (IF statement)
        //value = condition ? valueIfTrue: valueIfFalse
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
        
    }
    

    //MARK TableView Delegate Methods for when a row is selected
    
    
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        
        
        //Changes the tick toggles on or off at the right location
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
            
            
            
        //What to do if the row is selected
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        
        else {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    
    
        tableView.deselectRow(at: indexPath, animated: true)
    
        
        
        
    }
    //MARK - Add new Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What happens when a user clicks the Add Item button on our UIAlert
          
        
            let newItem = Item()
            newItem.title = textField.text!
           
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
        }
        
        //Alert box
        alert.addTextField { (alertTextField) in
        alertTextField.placeholder = "Enter item here"
        textField = alertTextField
      
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
            
    
        
        
    
    
    
    
    
}

