//
//  PlayerInfoViewController.swift
//  SoccerStats
//
//  Created by Ryan Spencer on 11/12/24.
//

import UIKit

class PlayerInfoViewController: UIViewController {

    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var goalsLabel: UILabel!
    @IBOutlet weak var shotsLabel: UILabel!
    @IBOutlet weak var shotsOnGoalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playerLabel.text = "\(AppData.teams[AppData.teamIndex].players[AppData.playerIndex].name) #\(AppData.teams[AppData.teamIndex].players[AppData.playerIndex].number)"
        goalsLabel.text = "\(AppData.teams[AppData.teamIndex].players[AppData.playerIndex].goals) goals"
        shotsLabel.text = "\(AppData.teams[AppData.teamIndex].players[AppData.playerIndex].shots) shots"
        shotsOnGoalLabel.text = "\(AppData.teams[AppData.teamIndex].players[AppData.playerIndex].shotsOnGoal) shots on goal"
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
