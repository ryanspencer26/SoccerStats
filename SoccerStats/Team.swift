//
//  Team.swift
//  SoccerStats
//
//  Created by RYAN SPENCER on 11/20/24.
//

import Foundation

class Team: Codable {
    
    var name: String
    var wins: Int
    var losses: Int
    var wlRatio: Double
    var players: [Player]
    
    init(name: String) {
        self.name = name
        wins = 0
        losses = 0
        wlRatio = 0
        players = [Player]()
    }
    
    init(name: String, wins: Int, losses: Int){
        self.name = name
        self.wins = wins
        self.losses = losses
        wlRatio = Double(wins) / Double(losses)
        players = [Player]()
    }
    
}
