//
//  MainTableViewController.swift
//  simplyTodo
//
//  Created by Darshan Patel on 19/12/17.
//  Copyright © 2017 Darshan Patel. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    var mainArray = ["akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag","akjnaksjcbn","zjcbjkzhcjkh","nvczhxgcjhag"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
      
        cell.textLabel?.text = mainArray[indexPath.row]

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    //MARK- new item
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new item!", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "add item", style: .default) { (action) in
            // what will happnd when user clicks the button
            print("action this is")
            self.mainArray.append(textField.text!)
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextfiled) in
            alertTextfiled.placeholder = "add new simplyTodo"
            textField = alertTextfiled
        }
         alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    

}
