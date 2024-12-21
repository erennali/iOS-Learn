//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Eren Ali Koca on 21.12.2024.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{
    

    var mySimpsons = [Simpsons]()
    var chosenSimpson : Simpsons?
    
    @IBOutlet weak var viewController: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewController.dataSource = self
        viewController.delegate = self
        
        //Simpson Objects
              
        let homer = Simpsons(name: "Homer Simpson", job: "Nuclear Safety", image: UIImage(named: "homer")!)
              
               let marge = Simpsons(name: "Marge Simpson", job: "Housewife", image: UIImage(named: "marge")!)
              
               let bart = Simpsons(name: "Bart Simpson", job: "Student", image: UIImage(named: "bart")!)
              
               let lisa = Simpsons(name: "Lisa Simpson", job: "Student", image: UIImage(named: "lisa")!)
              
               let maggie = Simpsons(name: "Maggie Simpson", job: "Baby", image: UIImage(named: "maggie")!)
     
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let detailsVC = segue.destination as! detailsVC
            detailsVC.selectedSimpson = chosenSimpson
        }
    }


}

