//
//  ViewController.swift
//  test_calculator
//
//  Created by ActumLab on 20/07/2017.
//  Copyright © 2017 ActumLab. All rights reserved.
//

//todo
// after clicking equals do the same operation on last numbers
// visual fixes
// reset


import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false
    var operation = 0;
    var numberOfCharacters:String = "";
    var equalsClicked = false;
    var result = "";
    var newOperation = 0;
    var operationChange = false;
    var historyFullResult:String = "";
    var arrayHistory: [String] = ["-","-","-","-","-","-","-"]
    var actuallNumberInHistory = 0;
    var createdHistory:Bool = false;

    
    let maxNumbersOnScreen:Int = 9;
    let maxNumberOfHistorySlots = 6;

    
    @IBAction func buttonHistory(_ sender: Any)
    {
      //  if textField.text != ""
      //  {
      //      performSegue(withIdentifier: "segue", sender: self)
      //  }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let secondController = segue.destination as! SecondViewController
        secondController.result1 = arrayHistory[0]
        secondController.result2 = arrayHistory[1]
        secondController.result3 = arrayHistory[2]
        secondController.result4 = arrayHistory[3]
        secondController.result5 = arrayHistory[4]
        secondController.result6 = arrayHistory[5]
        secondController.result7 = arrayHistory[6]
    }
    
    func createHistory()
    {
        if createdHistory == false {
            
        for currentNumberOfArray in (1...maxNumberOfHistorySlots).reversed()
        {
            arrayHistory[currentNumberOfArray] = arrayHistory[(currentNumberOfArray - 1)]
        }
        
        arrayHistory[0] = historyFullResult
            
            createdHistory = true
            
        }
        
    }

    
    func hardReset()
    {
        label.text = ""
        labelHistory.text = ""
        previousNumber = 0
        numberOnScreen = 0
        operation = 0
        newOperation = 0
        operationChange = false
        historyFullResult = ""
        createdHistory = false
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var labelHistory: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        operationChange = false
        createdHistory = false
        
        if newOperation != 0
        {
            operation = newOperation
        }
        
        if equalsClicked == true
        {
            hardReset()
            labelHistory.text = result
            equalsClicked = false
        }
        
        label.adjustsFontSizeToFitWidth = true
        numberOfCharacters = label.text!
        
        if numberOfCharacters.characters.count >= maxNumbersOnScreen
        {
            // zabezpieczenie = wpisanie max znakow na ekranie
        }
        else
        {
        if performingMath == true
        {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else
        {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
        }
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 && operation == 0
        {
            operationChange = true
            if newOperation == 0
            {
            previousNumber = Double(label.text!)!
            }
            
            if sender.tag == 12 //Divide
            {
                label.text = "/";
                newOperation = sender.tag
            }
            else if sender.tag == 13 //Multiply
            {
                label.text = "x";
                newOperation = sender.tag
            }
            else if sender.tag == 14 //Minus
            {
                label.text = "-";
                newOperation = sender.tag
            }
            else if sender.tag == 15 //Plus
            {
                label.text = "+";
                newOperation = sender.tag
            }
            
            
            labelHistory.adjustsFontSizeToFitWidth = true
            labelHistory.text = String(previousNumber)
            //operation = sender.tag
            performingMath = true;
        }
        else if sender.tag == 16 // equals
        {
            equalsClicked = true
            if operation == 12
            {
                if numberOnScreen == 0
                {
                    label.text = "error"
                }
                else
                {
                label.text = String(previousNumber / numberOnScreen)
                    result = label.text!
                    historyFullResult += String(previousNumber) + " / " + String(numberOnScreen) + " = " + String(result)
                    createHistory()
                }
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numberOnScreen)
                result = label.text!
                historyFullResult += String(previousNumber) + " * " + String(numberOnScreen) + " = " + String(result)
                createHistory()
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numberOnScreen)
                result = label.text!
                historyFullResult += String(previousNumber) + " - " + String(numberOnScreen) + " = " + String(result)
                createHistory()
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numberOnScreen)
                result = label.text!
                historyFullResult += String(previousNumber) + " + " + String(numberOnScreen) + " = " + String(result)
                createHistory()
            }
            
        }
        else if sender.tag == 11
        {
            hardReset()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

