//
//  ViewController.swift
//  SoccerStats
//
//  Created by RYAN SPENCER on 10/28/24.
//

import UIKit

class AppData{
    
    static var totalTime = 5400
    static var players: [Player] = [Player]()
    static var homeScore = 0
    static var awayScore = 0
    static var homeShots = 0
    static var awayShots = 0
    static var homeSOG = 0
    static var awaySOG = 0
    static var homeSaves = 0
    static var awaySaves = 0
    static var homeCorners = 0
    static var awayCorners = 0
    static var games: [Game] = [Game]()
    static var index: Int!
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let thePlayers = UserDefaults.standard.data(forKey: "players") {
                        let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Player].self, from: thePlayers) {
                AppData.players = decoded
                        }
                }
        
        if let theGames = UserDefaults.standard.data(forKey: "games") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Game].self, from: theGames) {
                AppData.games = decoded
            }
        }
        
    }


}

