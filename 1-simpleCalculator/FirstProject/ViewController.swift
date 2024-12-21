//
//  ViewController.swift
//  FirstProject
//
//  Created by Eren Ali Koca on 15.12.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func toplaClicked(_ sender: Any) {
        if let firstNumber=Int(firstText.text!){
            if let secondNumber=Int(secondText.text!) {
                
                result = firstNumber + secondNumber
                resultLabel.text=String(result)
            }
        }
    }
    
    @IBAction func cikarClicked(_ sender: Any) {
        if let firstNumber=Int(firstText.text!){
            if let secondNumber=Int(secondText.text!) {
                
                result = firstNumber - secondNumber
                resultLabel.text=String(result)
            }
        }
    }
    
    @IBAction func carpClicked(_ sender: Any) {
        if let firstNumber=Int(firstText.text!){
            if let secondNumber=Int(secondText.text!) {
                
                result = firstNumber * secondNumber
                resultLabel.text=String(result)
            }
        }
    }
    
    @IBAction func bolClicked(_ sender: Any) {
        if let firstNumber=Int(firstText.text!){
            if let secondNumber=Int(secondText.text!) {
                
                result = firstNumber / secondNumber
                resultLabel.text=String(result)
            }
        }
    }
    
    
}

