//
//  SettingsViewController.swift
//  15-FirebaseInstaClone
//
//  Created by Eren Ali Koca on 5.01.2025.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        }catch{
            print(error)
        }
        
    }
    
   

}
