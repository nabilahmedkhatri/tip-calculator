//
//  ViewController.swift
//  Tipster
//
//  Created by Nabil on 9/9/18.
//  Copyright © 2018 Nabil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    @IBOutlet weak var settings: UIBarButtonItem!
    
    override func viewDidLoad() {
        self.title = "Tip Calculator"
        self.billField.becomeFirstResponder()
        billField.text = defaults.string(forKey: "lastBillAmount") ?? ""
        calculateTip(self)
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically   from a nib.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    override func viewWillAppear(_ animated: Bool) {
        let tipIndex = defaults.integer(forKey: "defaultTipAmount")
        tipControl.selectedSegmentIndex = tipIndex
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        defaults.set(billField.text, forKey: "lastBillAmount")
        defaults.synchronize()
        let tipPercentages = [0.18, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        if bill == 0 {
            billField.text = ""
        }
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
}

