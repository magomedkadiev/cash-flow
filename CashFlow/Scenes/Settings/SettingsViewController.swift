//
//  SettingsViewController.swift
//  CashFlow
//
//  Created by Султанхан on 23.07.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    static func controller() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
