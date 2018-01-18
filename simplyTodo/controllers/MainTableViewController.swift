//
//  MainTableViewController.swift
//  simplyTodo
//
//  Created by Darshan Patel on 19/12/17.
//  Copyright © 2017 Darshan Patel. All rights reserved.
//

import UIKit
import CoreData

class MainTableViewController: UITableViewController {
    var mainArray = [Item]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fatchData()
        print(mainArray)
        
    }

   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mainArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
      
        let item = mainArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
       
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = mainArray[indexPath.row]
       item.done = !item.done
        
        saveItem()
       
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //Mark: slide and delete function is here
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
       
        context.delete(mainArray[indexPath.row])
        mainArray.remove(at: indexPath.row)
        tableView.reloadData()
        print(mainArray)
        
    }
    

    //MARK- new item
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new item!", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "add item", style: .default) { (action) in
            // what will happnd when user clicks the button
            print("action this is")
            
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false
            self.mainArray.append(newItem)
           
            self.tableView.reloadData()
            self.saveItem()
        }
        alert.addTextField { (alertTextfiled) in
            alertTextfiled.placeholder = "add new simplyTodo"
            textField = alertTextfiled
        }
         alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    // Mark: save items
    func saveItem(){
        do{
            try context.save()
        }catch{
            print("error")
        }
        self.tableView.reloadData()
    }
    
    //Mark: reading from coredata
    func fatchData(){
        let request : NSFetchRequest<Item> = Item.fetchRequest()
        do {
         mainArray = try context.fetch(request)}
        catch{
            print("error = ",error)
        }
    }
    
    

}
