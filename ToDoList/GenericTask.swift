//
//  GenericTask.swift
//  ToDoList
//
//  Created by picho on 30/4/17.
//  Copyright © 2017 Picho. All rights reserved.
//

import Foundation

public class GenericTask {
    
    var name : String?
    var isImportant : Bool?
    var dateCreated : Date?
    
    init(name: String, isImportant : Bool, dateCreated : Date) {
        self.name = name
        self.isImportant = isImportant
        self.dateCreated = dateCreated
    }
    
    convenience init() {
        self.init(name: "", isImportant: false, dateCreated: Date())
    }
    
    class func makeGenerticTask(task: Task) -> GenericTask {
        return GenericTask(name: task.name!, isImportant: task.isImportant, dateCreated: task.dateCreate! as Date)
    }
}
