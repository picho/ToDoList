//
//  DetailTaskViewController.swift
//  ToDoList
//
//  Created by picho on 30/4/17.
//  Copyright © 2017 Picho. All rights reserved.
//

import UIKit

class DetailTaskViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var isImportant: UILabel!
    @IBOutlet weak var dateCreated: UILabel!
    var task = GenericTask()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 0, green:  140, blue:  255)
        name.textColor = UIColor.white
        isImportant.textColor = UIColor.white
        dateCreated.textColor = UIColor.white
        
        name.text = task.name
        isImportant.text = task.isImportant! ? "is Important 😳" : ""
        dateCreated.text = Date.DateToString(date: task.dateCreated!)
        
    }
    
    
    

}
