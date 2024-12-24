//
//  ViewController.swift
//  13-FaceRecognition
//
//  Created by Eren Ali Koca on 24.12.2024.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Info.plist Privacy - Face Id eklemeyi unutma
    @IBAction func signInButtonClicked(_ sender: Any) {
        
        let authContext = LAContext()
               
               var error: NSError?
               
               if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                   
                   authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { (success, error) in
                       if success == true {
                           //successful auth
                           DispatchQueue.main.async {
                               self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                           }
                       } else {
                           DispatchQueue.main.async {
                               self.myLabel.text = "Error!"
                           }
                       }
                   }
                   
                   
               }
               
               
           }
       } 

