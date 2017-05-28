//
//  EditViewController.swift
//  ToDoList
//
//  Created by picho on 22/5/17.
//  Copyright © 2017 Picho. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    var indexTask : Int = 0
    var taskArray : [Task] = []
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var importantSw: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 0, green:  140, blue:  255)
        getData()
        let task = taskArray[indexTask]
        nameTxt.text = task.name
        importantSw.isOn = task.isImportant
        // Do any additional setup after loading the view.
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
    
    @IBAction func editTask(_ sender: Any) {
        if nameTxt.text == "" {
            let alert = UIAlertController.twoButtonAlert(alertTitle: "hola", alertMessage: "como estas",firstButtonName: "OK",secondButtonName: "Cancel",styleFirstButton: UIAlertActionStyle.default, styleSecondButton: UIAlertActionStyle.destructive)
            
            present(alert, animated: true, completion: nil)
        }
        else{
            var alert : UIAlertController
            if editTaskObject(index: indexTask){
                alert = UIAlertController.twoButtonAlert(alertTitle: "hola", alertMessage: "como estas",firstButtonName: "OK",secondButtonName: "Cancel",styleFirstButton: UIAlertActionStyle.default, styleSecondButton: UIAlertActionStyle.destructive)
                
                alert = UIAlertController.oneButtonAlertWithMethod(alertTitle: "Done", alertMessage: "Your task was update")
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                    self.navigationController?.popViewController(animated: true)
                }))
                
            }
            else{
                alert = UIAlertController.oneButtonAlertWithMethod(alertTitle: "Error", alertMessage: "Your task was not update")
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                    self.navigationController?.popViewController(animated: true)
                }))
            }
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    func editTaskObject(index: Int) -> Bool {
        
        var success: Bool = false
        let task = taskArray[index]
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        do{
            
            task.setValue( nameTxt.text, forKey: "name")
            task.setValue( importantSw.isOn, forKey: "isImportant")
            try context.save()
            self.viewDidLoad() // why you call this line here ?
            print("saved")
            success = true
        }
        catch{
            print("could not save")
        }
        
        return success
    }
}
