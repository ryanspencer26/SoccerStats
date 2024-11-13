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
        playerLabel.text = "\(AppData.players[AppData.index].name) #\(AppData.players[AppData.index].number)"
        goalsLabel.text = "\(AppData.players[AppData.index].goals) goals"
        shotsLabel.text = "\(AppData.players[AppData.index].shots) shots"
        shotsOnGoalLabel.text = "\(AppData.players[AppData.index].shotsOnGoal) shots on goal"
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
