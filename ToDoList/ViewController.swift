//
//  ViewController.swift
//  ToDoList
//
//  Created by picho on 23/4/17.
//  Copyright © 2017 Picho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var taskArray : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = UIColor.rgb(red: 0, green:  140, blue:  255)
        tableView.backgroundColor = UIColor.rgb(red: 0, green:  140, blue:  255)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        let task = taskArray[indexPath.row]
        
        cell.textLabel?.text = task.name!
        if task.isImportant{
            cell.detailTextLabel?.text = "is Important 😳"
        }
        else{
            cell.detailTextLabel?.text = ""
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = tableView.indexPathForSelectedRow!.row
        
        performSegue(withIdentifier: "DetailTaskSegue", sender: index)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.destructive, title: "Delete") { (action , indexPath ) -> Void in
            self.deleteTask(index: indexPath.row)
        }
        
        let editAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Edit") { (action , indexPath) -> Void in

            self.performSegue(withIdentifier: "EditTaskSegue", sender: self.index)
            
        }
        
        deleteAction.backgroundColor = UIColor.red
        editAction.backgroundColor = UIColor.blue
        
        return [deleteAction, editAction]
    }
    
    func getData(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            taskArray = try context.fetch(Task.fetchRequest())
        }
        catch{
            print("error")
        }
    }
    
    func deleteTask(index : Int) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = taskArray[index]
        context.delete(task)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        do{
            taskArray = try context.fetch(Task.fetchRequest())
        }
        catch{
            print("error")
        }
        tableView.reloadData()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DetailTaskSegue" {
            if let destination = segue.destination as? DetailTaskViewController {
                if let index = sender as? Int {
                    destination.task = makeGenerticTask(task: taskArray[index])
                }
            }
        }
        else if segue.identifier == "EditTaskSegue" {
            if let destination = segue.destination as? EditViewController {
                if let index = sender as? Int {
                    destination.task = makeGenerticTask(task: taskArray[index])
                }
            }
        }
    }
    
    func makeGenerticTask(task: Task) -> GenericTask {
        return GenericTask(name: task.name!, isImportant: task.isImportant, dateCreated: task.dateCreate! as Date)
    }
    
}

