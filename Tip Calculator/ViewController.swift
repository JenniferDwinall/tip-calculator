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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard

        tipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = defaults.double(forKey: "defaultBill")
        let tip = bill * Double(tipPercentages[tipControl.selectedSegmentIndex])
        let total = bill + tip
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!

        billText.text = String(format: "%.2f", bill)
        tipLabel.text = String(format: "%@%.2f", currencySymbol, tip)
        totalLabel.text = String(format: "%@%.2f", currencySymbol, total)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    @IBAction func saveBillAmount(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(billText.text, forKey: "defaultBill")
        defaults.synchronize()
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billText.text!) ?? 0
        let tip = bill * Double(tipPercentages[tipControl.selectedSegmentIndex])
        let total = bill + tip
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!

        tipLabel.text = String(format: "%@%.2f", currencySymbol, tip)
        totalLabel.text = String(format: "%@%.2f", currencySymbol, total)
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
}

