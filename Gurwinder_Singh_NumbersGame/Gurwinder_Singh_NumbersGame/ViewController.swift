//
//  ViewController.swift
//  Gurwinder_Singh_NumbersGame
//
//  Created by Gurwinder Singh on 2023-06-08.
//
//
import UIKit

class ViewController: UIViewController {
    var originalButtonTexts: [String] = ["2", "0", "0", "5", "5", "7", "4", "9", "7"]
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    var buttonTexts: [String] = []
    
    @IBOutlet weak var Reset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Store the original button texts
        buttonTexts = originalButtonTexts
    }
    
    @IBAction func buttonTouched(_ sender: UIButton) {
        guard let buttonText = sender.currentTitle else {
            return
        }
        
        if buttonText == "7" {
            // If the button text is already "7", do nothing
            return
        } else if let index = buttonTexts.firstIndex(of: buttonText) {
            // If the button text is in the buttonTexts array, update it
            let currentValue = Int(buttonText)!
            if currentValue > 7 {
                // If the current value is greater than 7, decrease by 1
                buttonTexts[index] = String(currentValue - 1)
            } else {
                // If the current value is less than 7, increase by 1
                buttonTexts[index] = String(currentValue + 1)
            }
            
            sender.setTitle(buttonTexts[index], for: .normal)
        }
    }
    
    @IBAction func test1(_ sender: UIButton) {
        button1.setTitle("2", for: .normal)
        button2.setTitle("0", for: .normal)
        button3.setTitle("0", for: .normal)
        button4.setTitle("5", for: .normal)
        button5.setTitle("5", for: .normal)
        button6.setTitle("7", for: .normal)
        button7.setTitle("4", for: .normal)
        button8.setTitle("9", for: .normal)
        button9.setTitle("7", for: .normal)
        
    }
    
}
