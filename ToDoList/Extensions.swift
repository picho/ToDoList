//
//  Extensions.swift
//  ToDoList
//
//  Created by picho on 27/4/17.
//  Copyright © 2017 Picho. All rights reserved.
//

import UIKit

extension UIColor{
    /**
     Metodo que determina un color, recibe tres numeros(rojo,verde,azul)de tipo CGFloat
     
     - Parameter red: Una cantidad en un rango de 0 a 255 que define la cantidad de rojo que compone un color
     - Parameter green: Una cantidad en un rango de 0 a 255 que define la cantidad de verde que compone un color
     - Parameter blue: Una cantidad en un rango de 0 a 255 que define la cantidad de azul que compone un color
     - Returns: Un color (objeto de tipo UIColor)
     - Remark: Se utiliza para cuando se quiere un color determinado, facilita la obtencion de un objeto UIColor
    */
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}


extension UIAlertController{
    static func twoButtonAlert(alertTitle: String, alertMessage: String, firstButtonName: String, secondButtonName: String, styleFirstButton: UIAlertActionStyle, styleSecondButton: UIAlertActionStyle ) -> UIAlertController {
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: firstButtonName, style: styleFirstButton, handler: { (action) -> Void in
            print("ok")
        }))
        alert.addAction(UIAlertAction(title: secondButtonName, style: styleSecondButton, handler: { action in
            print("cancel")
        }))
        
        return alert
    }
    
    static func oneButtonAlertWithMethod(alertTitle: String, alertMessage: String) -> UIAlertController {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        return alert
    }
}

extension Date {
    /**
     Metodo que facilita la convercion de una fecha a string
     
     - Parameter date: Variable de tipo date que se formateara para convertirlo en un string
     - Returns: Una fecha convertida a string
     - Remark: Se utiliza cuando se quiere convertir una fecha a string con el formato dd/MM/yyyy
    */
    static func DateToString(date : Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)

    }
}
