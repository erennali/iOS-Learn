//
//  ViewController.swift
//  12-DarkMode
//
//  Created by Eren Ali Koca on 24.12.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var touchButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //overrideUserInterfaceStyle = .light
        
        //Info.plist -> Appearance = Dark
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
          let userInterfaceStyle = traitCollection.userInterfaceStyle
                
                if userInterfaceStyle == .dark {
                    touchButton.tintColor = UIColor.white
                } else {
                    touchButton.tintColor = UIColor.blue
                }
                
      }
      
      override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
          let userInterfaceStyle = traitCollection.userInterfaceStyle
                      
                      if userInterfaceStyle == .dark {
                          touchButton.tintColor = UIColor.white
                      } else {
                          touchButton.tintColor = UIColor.blue
                      }
      }
}

