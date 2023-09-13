//
//  ViewController.swift
//  Gurwinder-Singh-Green-Calculator
//
//  Created by Gurwinder Singh on 2023-05-21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var numberDisplay: UITextField!
    var startNewNumber = true
    var calculatorModel = Gurwinder_Calculator_Model()
    
    
   //MARK: Functions
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //MARK: IBActions
    
    @IBAction func buttnTouched(_ sender: UIButton) {
        print("Button Touched")
        print(sender.currentTitle!)
        

        let buttonText = sender.currentTitle!
        
        var currentValue = numberDisplay.text!

        switch(buttonText) {
            case  "0", "1", "2", "3", "4","5","6","7","8", "9",".":
                print(buttonText)
            if (startNewNumber) {
                if (buttonText == "."){
                    currentValue = "0."
                }else{
                    currentValue = buttonText
                }
            } else {
                if (buttonText == "."){
                    if(currentValue.contains(".")){
                        //do nothing
                    }else {
                        currentValue = currentValue + buttonText
                    }
                }else {
                    currentValue = currentValue + buttonText
                }
                }
            startNewNumber = false
            calculatorModel.updateNumber(newNumber:  Double(currentValue)!)
                // do something
        case "+", "-",  "x",  "/":
            if(calculatorModel.secondNumber != nil){
                currentValue = String(calculatorModel.getResult())
                calculatorModel.reset()
                calculatorModel.updateNumber(newNumber:  Double(currentValue)!)
            
            }
            calculatorModel.operation = buttonText
            startNewNumber = true
           // print(startNewNumber)
            // accept second number after this
        case "=":
            // get result and display it
            if(calculatorModel.secondNumber == nil){
                calculatorModel.updateNumber(newNumber:  Double(currentValue)!)
                
            }
            currentValue = String(calculatorModel.getResult())
            startNewNumber = true
            
        case "C":
            currentValue = "0"
            calculatorModel.reset()
            startNewNumber = true
       
                default:
                // do something by default
                print(buttonText)
                }
        numberDisplay.text = currentValue
        
        }
    
    
    
}

