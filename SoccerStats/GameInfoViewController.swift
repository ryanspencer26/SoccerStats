//
//  GameInfoViewController.swift
//  SoccerStats
//
//  Created by Ryan Spencer on 12/11/24.
//

import UIKit

class GameInfoViewController: UIViewController {

    @IBOutlet weak var teamNames: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var homeShots: UILabel!
    @IBOutlet weak var homeSOG: UILabel!
    @IBOutlet weak var homeCorners: UILabel!
    @IBOutlet weak var homeSaves: UILabel!
    
    @IBOutlet weak var awayShots: UILabel!
    @IBOutlet weak var awaySOG: UILabel!
    @IBOutlet weak var awaySaves: UILabel!
    @IBOutlet weak var awayCorners: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        teamNames.text = "\(AppData.games[AppData.gameIndex].homeTeam) vs. \(AppData.games[AppData.gameIndex].awayTeam)"
        score.text = "\(AppData.games[AppData.gameIndex].homeScore)-\(AppData.games[AppData.gameIndex].awayScore)"
        homeShots.text = "\(AppData.games[AppData.gameIndex].homeShots)"
        awayShots.text = "\(AppData.games[AppData.gameIndex].awayShots)"
        homeSOG.text = "\(AppData.games[AppData.gameIndex].homeSOG)"
        awaySOG.text = "\(AppData.games[AppData.gameIndex].awaySOG)"
        homeSaves.text = "\(AppData.games[AppData.gameIndex].homeSaves)"
        awaySaves.text = "\(AppData.games[AppData.gameIndex].awaySaves)"
        homeCorners.text = "\(AppData.games[AppData.gameIndex].homeCorners)"
        awayCorners.text = "\(AppData.games[AppData.gameIndex].awayCorners)"
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
