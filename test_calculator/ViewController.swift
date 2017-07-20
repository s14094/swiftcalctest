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
    
    

    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 15 && sender.tag != 16
        {
            if sender.tag == 11 // /
            {
                label.text = "/"
            }
            else if sender.tag == 12 // x
            {
                label.text = "x"
            }
            else if sender.tag == 13 // -
            {
                label.text = "-"
            }
            else if sender.tag == 14 // +
            {
                label.text = "+"
            }
        }
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        if sender.tag == 10
        {
            label.text = label.text! + "0"
        }
        else
        {
            label.text = label.text! + String(sender.tag)
        }
        numberOnScreen = Double(label.text!)!
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

