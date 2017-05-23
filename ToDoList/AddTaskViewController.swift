//
//  AddTaskViewController.swift
//  ToDoList
//
//  Created by picho on 23/4/17.
//  Copyright © 2017 Picho. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var isImportant: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        view.backgroundColor = UIColor.rgb(red: 0, green:  140, blue:  255)
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAddTask(_ sender: Any) {
        
        if textField.text == "" {
            
            let alert = UIAlertController.twoButtonAlert(alertTitle: "hola", alertMessage: "como estas",firstButtonName: "OK",secondButtonName: "Cancel",styleFirstButton: UIAlertActionStyle.default, styleSecondButton: UIAlertActionStyle.destructive)
            
            self.present(alert, animated: true, completion: nil)
            
        }
        else {
            
            textField.resignFirstResponder()
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
            let task = Task(context: context)
        
            task.name = textField.text!
            task.isImportant = isImportant.isOn
            task.dateCreate = Date() as NSDate

            print(Date.DateToString(date: task.dateCreate! as  Date))
        
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    
}
