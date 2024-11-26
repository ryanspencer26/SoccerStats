//
//  TeamAddViewController.swift
//  SoccerStats
//
//  Created by LOGAN GOUGH on 11/26/24.
//

import UIKit

class TeamAddViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func buttonTeam(_ sender: UIButton) {
        
        var blah = String(nameLabel.text!)
        let add = Team(name: blah)
        AppData.teams.append(add)
    }
    
  

     }
