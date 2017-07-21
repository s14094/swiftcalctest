//
//  ViewController.swift
//  test_calculator
//
//  Created by ActumLab on 20/07/2017.
//  Copyright © 2017 ActumLab. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false
    var operation = 0;
    var numberOfCharacters:String = "";
    var equalsClicked = false;
    var result = "";
    
    let maxNumbersOnScreen:Int = 9;

    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var labelHistory: UILabel!
    
    
    @IBAction func numbers(_ sender: UIButton)
    {
        
        if equalsClicked == true
        {
            label.text = ""
            labelHistory.text = result
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
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
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12 //Divide
            {
                label.text = "/";
            }
            else if sender.tag == 13 //Multiply
            {
                label.text = "x";
            }
            else if sender.tag == 14 //Minus
            {
                label.text = "-";
            }
            else if sender.tag == 15 //Plus
            {
                label.text = "+";
            }
            
            labelHistory.adjustsFontSizeToFitWidth = true
            labelHistory.text = String(previousNumber)
            operation = sender.tag
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
            label.text = ""
            labelHistory.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
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

