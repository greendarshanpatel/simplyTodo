//
//  MainTableViewController.swift
//  simplyTodo
//
//  Created by Darshan Patel on 19/12/17.
//  Copyright © 2017 Darshan Patel. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    var mainArray = [Item]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    //"akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag"
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let newItem = Item()
        newItem.title = "akjnaksjcbn"
        mainArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "akjnaksjcbn2"
        mainArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "akjnaksjcbn3"
        mainArray.append(newItem3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
       
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
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
            self.mainArray.append(newItem)
           
            self.tableView.reloadData()
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
    }
    
    

}
