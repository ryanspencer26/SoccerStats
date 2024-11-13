//
//  AddPlayerViewController.swift
//  SoccerStats
//
//  Created by RYAN SPENCER on 11/6/24.
//

import UIKit

class AddPlayerViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var yearField: UITextField!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var numberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presentingViewController?.viewWillAppear(true)
    }
    
    @IBAction func addPlayer(_ sender: Any) {
        if let num = Int(numberField.text!){
            if let yr = Int(yearField.text!){
                if nameField.text! != ""{
                    if segmentControl.selectedSegmentIndex == 0{
                        AppData.players.append(Player(name: nameField.text!, number: num, year: yr, team: "Home"))
                    } else {
                        AppData.players.append(Player(name: nameField.text!, number: num, year: yr, team: "Away"))
                    }
                    let encoder = JSONEncoder()
                    if let encoded = try? encoder.encode(AppData.players) { UserDefaults.standard.set(encoded, forKey: "players")
                    }
                    self.dismiss(animated: true)
                    return
                }
            }
        }
        let alert = UIAlertController(title: "Error", message: "Invalid Input", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tapRecognized(_ sender: Any) {
        view.endEditing(true)
    }
    
}
