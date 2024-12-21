//
//  SecondViewController.swift
//  segue-safyaGecisi
//
//  Created by Eren Ali Koca on 17.12.2024.
//

import UIKit

class SecondViewController: UIViewController {

    var myName = ""
    
    @IBOutlet weak var myLabelSecond: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = myName
        // Do any additional setup after loading the view.
    }
    

    

}
