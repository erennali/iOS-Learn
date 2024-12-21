//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Eren Ali Koca on 17.12.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    var isAbout1 = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        //Jest Algılayıcılar
        imageView.addGestureRecognizer(gestureRecognizer)
    }

    @objc func changePic(){
        
        
        if isAbout1 == true {
            imageView.image = UIImage(named: "about-main")
            myLabel.text = "Ziyafet"
            isAbout1 = false}
            else {
                imageView.image = UIImage(named: "about-inset")
                myLabel.text = "Sulu Köfte"
                isAbout1 = true
            }
                
            
        }
    }



