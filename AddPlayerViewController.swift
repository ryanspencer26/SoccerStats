//
//  AddPlayerViewController.swift
//  SoccerStats
//
//  Created by RYAN SPENCER on 11/6/24.
//

import UIKit

class AddPlayerViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var inputLabel: UILabel!
    
    @IBOutlet weak var yearField: UITextField!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var numberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputLabel.isHidden = true
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
                }
            }
        } else {
            inputLabel.text = "Invalid input"
            inputLabel.isHidden = false
        }
        // save to userDefaults
        self.dismiss(animated: true)
    }
    
    @IBAction func tapRecognized(_ sender: Any) {
        view.endEditing(true)
    }
    
}
