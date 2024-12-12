//
//  Game.swift
//  SoccerStats
//
//  Created by Ryan Spencer on 11/11/24.
//

import Foundation

class Game: Codable {
    
    var homeTeam: String
    var awayTeam: String
    var homeScore: Int
    var awayScore: Int
    var homeShots: Int
    var awayShots: Int
    var homeSOG: Int
    var awaySOG: Int
    var homeSaves: Int
    var awaySaves: Int
    var homeCorners: Int
    var awayCorners: Int
    
    init(homeTeam: String, awayTeam: String, homeScore: Int, awayScore: Int, homeShots: Int, awayShots: Int, homeSOG: Int, awaySOG: Int, homeSaves: Int, awaySaves: Int, homeCorners: Int, awayCorners: Int) {
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.homeScore = homeScore
        self.awayScore = awayScore
        self.homeShots = homeShots
        self.awayShots = awayShots
        self.homeSOG = homeSOG
        self.awaySOG = awaySOG
        self.homeSaves = homeSaves
        self.awaySaves = awaySaves
        self.homeCorners = homeCorners
        self.awayCorners = awayCorners
    }
    
}
