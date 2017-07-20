//
//  ViewController.swift
//  test_calculator
//
//  Created by ActumLab on 20/07/2017.
//  Copyright © 2017 ActumLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func numbers(_ sender: UIButton) {
            label.text = label.text! + String(sender.tag-1)
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

