//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Jennifer Dwinall on 8/11/17.
//  Copyright © 2017 Jennifer Dwinall. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var TipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        TipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "defaultTip")
    }
    
    @IBAction func saveTipPercentage(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(TipControl.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
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
