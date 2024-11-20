//
//  Team.swift
//  SoccerStats
//
//  Created by RYAN SPENCER on 11/20/24.
//

import Foundation

class Team {
    
    var name: String
    var wins: Int
    var losses: Int
    var wlRatio: Double
    var players: [Player]
    
    init(name: String, wins: Int, losses: Int, wlRatio: Double, players: [Player]) {
        self.name = name
        self.wins = wins
        self.losses = losses
        self.wlRatio = wlRatio
        self.players = players
    }
    
}
