//
//  SettingsChangeViewController.swift
//  Tipster
//
//  Created by Nabil on 9/10/18.
//  Copyright © 2018 Nabil. All rights reserved.
//

import UIKit

class SettingsChangeViewController: UIViewController {
    let defaults = UserDefaults.standard

    @IBOutlet weak var defaultTip: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tipIndex = defaults.integer(forKey: "defaultTipAmount")
        defaultTip.selectedSegmentIndex = tipIndex
        super.viewWillAppear(animated)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeDefault(_ sender: Any) {
        defaults.set(defaultTip.selectedSegmentIndex, forKey: "defaultTipAmount")
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
