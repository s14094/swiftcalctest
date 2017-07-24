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
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var label6: UILabel!
    
    @IBOutlet weak var label7: UILabel!
    
    @IBAction func resetButton(_ sender: Any) {
        label1.text = "-"
        label2.text = "-"
        label3.text = "-"
        label4.text = "-"
        label5.text = "-"
        label6.text = "-"
        label7.text = "-"
    }
    
    //TODO 2 petle
    
    var result1 = String()
    var result2 = String()
    var result3 = String()
    var result4 = String()
    var result5 = String()
    var result6 = String()
    var result7 = String()

    
    override func viewDidLoad() {
        //super.viewDidLoad()

        //todo petla
        label1.text = result1
        label2.text = result2
        label3.text = result3
        label4.text = result4
        label5.text = result5
        label6.text = result6
        label7.text = result7
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
