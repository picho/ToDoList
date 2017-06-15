//
//  PaymentViewController.swift
//  ToDoList
//
//  Created by picho on 14/6/17.
//  Copyright © 2017 Picho. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    
    //TextField
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var percentage: UITextField!
    @IBOutlet weak var people: UITextField!
    
    //Labels
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblPercentage: UILabel!
    @IBOutlet weak var lblPeople: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    @IBOutlet weak var lblTotalPercentage: UILabel!
    @IBOutlet weak var lblTotalPercentageAmount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 0, green:  140, blue:  255)
        lblAmount.textColor = UIColor.white
        lblPercentage.textColor = UIColor.white
        lblPeople.textColor = UIColor.white
        lblTotal.textColor = UIColor.white
        lblTotalAmount.textColor = UIColor.white
        lblTotalPercentage.textColor = UIColor.white
        lblTotalPercentageAmount.textColor = UIColor.white
        
        lblTotalAmount.text = ""
        lblTotalPercentageAmount.text = ""

    }

    @IBAction func processInvoice(_ sender: Any) {
        
        people.resignFirstResponder()
        
        let amountValue : Double = Double(amount.text!)!
        let percentageValue : Double = Double(percentage.text!)! / 100
        let percentageAmountValue : Double = Double(amount.text!)! * percentageValue
        let peopleValue : Double = Double(people.text! == "" ? "1" : people.text!)!
        let totalValue : Double = ((amountValue + percentageAmountValue) / peopleValue)
        
        print(amountValue)
        print(percentageValue)
        print(peopleValue)
        print(totalValue)
        
        lblTotalAmount.text = String(totalValue)
        
        lblTotalPercentageAmount.text = String(percentageValue / peopleValue)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}
