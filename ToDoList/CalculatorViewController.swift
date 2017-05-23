//
//  CalculatorViewController.swift
//  ToDoList
//
//  Created by picho on 16/5/17.
//  Copyright © 2017 Picho. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var mantiza: UILabel!
    var inicio: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mantiza.text = "0"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func number1(_ sender: Any) {
        comprobarMantizaCero(valor: "1")
        inicio = true
    }
    @IBAction func number2(_ sender: Any) {
        comprobarMantizaCero(valor: "2")
        inicio = true
    }
    @IBAction func number3(_ sender: Any) {
        comprobarMantizaCero(valor: "3")
        inicio = true
    }
    @IBAction func number4(_ sender: Any) {
        comprobarMantizaCero(valor: "4")
        inicio = true
    }
    @IBAction func number5(_ sender: Any) {
        comprobarMantizaCero(valor: "5")
        inicio = true
    }
    @IBAction func number6(_ sender: Any) {
        comprobarMantizaCero(valor: "6")
        inicio = true
    }
    @IBAction func number7(_ sender: Any) {
        comprobarMantizaCero(valor: "7")
        inicio = true
    }
    @IBAction func number8(_ sender: Any) {
        comprobarMantizaCero(valor: "8")
        inicio = true
    }
    @IBAction func number9(_ sender: Any) {
        comprobarMantizaCero(valor: "9")
        inicio = true
    }
    @IBAction func number0(_ sender: Any) {
        comprobarMantizaCero(valor: "0")
        inicio = true
    }
    @IBAction func point(_ sender: Any) {
        comprobarPunto(valor: ".")
        inicio = true
    }
    @IBAction func del(_ sender: Any) {
        mantiza.text = "0"
        inicio = false
    }
    
    @IBAction func numberPlus(_ sender: Any) {
        comprobarMantizaCero(valor: "+")
    }
    @IBAction func numberMinus(_ sender: Any) {
        comprobarMantizaCero(valor: "-")
    }
    @IBAction func numberTimes(_ sender: Any) {
        comprobarMantizaCero(valor: "*")
    }
    @IBAction func numberObelus(_ sender: Any) {
        comprobarMantizaCero(valor: "/")
    }
    
    @IBAction func numberEquals(_ sender: Any) {
        let result = NSExpression(format: mantiza.text!)
        mantiza.text = String(result.expressionValue(with: nil, context: nil) as! Double)
    }
    
    func comprobarMantizaCero(valor:String) {
        if mantiza.text == "0" {
            mantiza.text = valor
        }
        else {
            mantiza.text! += valor
        }
    }
    
    func comprobarPunto(valor: String) {
        if(mantiza.text == "0"){
            mantiza.text? += "."
        }
        else{
            if mantiza.text?.range(of: ".") == nil {
                mantiza.text? += "."
            }
        }
    }
    
    
    
}
