//
//  TeamAddViewController.swift
//  SoccerStats
//
//  Created by LOGAN GOUGH on 11/26/24.
//

import UIKit

class TeamAddViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var winField: UITextField!
    
    @IBOutlet weak var lossField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addTeam(_ sender: Any) {
        if nameField.text! != "" {
            if let wins = Int(winField.text!){
                if let losses = Int(lossField.text!){
                    AppData.teams.append(Team(name: nameField.text!, wins: wins, losses: losses))
                    let encoder = JSONEncoder()
                    if let encoded = try? encoder.encode(AppData.teams) { UserDefaults.standard.set(encoded, forKey: "teams")
                    }
                    self.dismiss(animated: true)
                }
            }
        }
    }
    
    @IBAction func tapRecognized(_ sender: Any) {
        view.endEditing(true)
    }
    
}
