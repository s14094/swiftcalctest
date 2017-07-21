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
// full history on new page or slider or something like this

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
    
    let maxNumbersOnScreen:Int = 9;



    @IBOutlet weak var textField: UITextField!
    
    @IBAction func buttonHistory(_ sender: Any)
    {
        if textField.text != ""
        {
            performSegue(withIdentifier: "segue", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let secondController = segue.destination as! SecondViewController
        secondController.result1 = textField.text!
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
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var labelHistory: UILabel!
    
    
    @IBAction func numbers(_ sender: UIButton)
    {
        operationChange = false
        
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
                }
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numberOnScreen)
            }
            result = label.text!
            
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

