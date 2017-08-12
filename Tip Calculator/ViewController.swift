//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Jennifer Dwinall on 8/11/17.
//  Copyright © 2017 Jennifer Dwinall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billText.text!) ?? 0
        let tip = bill * Double(tipPercentages[tipControl.selectedSegmentIndex])
        let total = bill + tip

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
}

