//
//  SecondViewController.swift
//  test_calculator
//
//  Created by ActumLab on 21/07/2017.
//  Copyright © 2017 ActumLab. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    var result1 = String()
    var result2 = String()
    
    override func viewDidLoad() {
        //super.viewDidLoad()

        label1.text = result1
        label2.text = result2
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
