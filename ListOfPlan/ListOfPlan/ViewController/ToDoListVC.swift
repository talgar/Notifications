//
//  TableViewController.swift
//  ListOfPlan
//
//  Created by admin on 20.06.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoListVC: UITableViewController {
    
    private let realm = try! Realm()
    private var toDoItems = [Items]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoItems = realm.objects(Items.self).map({ $0 })
        tableView.reloadData()
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item = toDoItems[indexPath.row]
       
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM, yyyy, h:mm a"
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = formatter.string(from: item.date)
        
        
        if (item.completed) == true  {
            cell.imageView?.image = #imageLiteral(resourceName: "check")
        } else {
           cell.imageView?.image = #imageLiteral(resourceName: "uncheck")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
       
        let item = toDoItems[indexPath.row]
        try! self.realm.write({
            item.completed = !item.completed
        })
        
        //refresh rows
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            let item = toDoItems[indexPath.row]
            try! self.realm.write({
                self.realm.delete(item)
            })
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {}
    }
}



