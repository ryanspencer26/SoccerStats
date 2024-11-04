//
//  Player.swift
//  SoccerStats
//
//  Created by RYAN SPENCER on 11/1/24.
//

import Foundation

class Player: Codable{
    
    var name: String
    var number: Int
    var year: Int
    var goals: Int
    var assists: Int
    var shots: Int
    var shotsOnGoal: Int
    var saves: Int
    
    init(name: String, number: Int, year: Int){
        self.name = name
        self.number = number
        self.year = year
        goals = 0
        assists = 0
        shots = 0
        shotsOnGoal = 0
        saves = 0
    }
    
}
