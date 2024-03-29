//
//  ViewController.swift
//  Todoey
//
//  Created by CMG on 7/11/19.
//  Copyright © 2019 CMG. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    //let itemArray = ["Find Mike", "Buy Eggs", "Destroy Demogorgon"]
    var itemArray = ["Find Mike", "Buy Eggs", "Destroy Demogorgon"]
    
    let defaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //itemArray = defaults.array(forKey: "ToDoListArray") as! [String]...so will not crash if nil
        
        if let items = UserDefaults.standard.array(forKey: "ToDoListArray") as? [String] {
            itemArray = items
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print (itemArray[indexPath.row])
        
        //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    
    @IBAction func barButtonPressed(_ sender: UIBarButtonItem) {
    
    var textField = UITextField()

    let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
        //what will happen when add item button pushed to add item to UIAlert
        //print ("Success!")
       // print(alertTextField.text)
        //print(textField.text)
        //print("When add item button pushed")
        
        self.itemArray.append(textField.text!)
        
        self.defaults.set(self.itemArray, forKey: "ToDoListArray")
        
        self.tableView.reloadData()
        
        
        
            
            
            
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat new item"
            textField = alertTextField
            //print(alertTextField.text)
            //print("now")
        
    }
        
        
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    
    
    }


}
