//
//  ScoreboardViewController.swift
//  SoccerStats
//
//  Created by RYAN SPENCER on 10/28/24.
//

import UIKit

class ScoreboardViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    var timer: Timer!
    var live: Bool = false
    var timerStarted: Bool = false
    @IBOutlet weak var awayScoreLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        AppData.players.append(Player(name: "Spence", number: 8, year: 11, team: "Home"))
        AppData.players.append(Player(name: "Ryan", number: 17, year: 12, team: "Home"))
        AppData.players.append(Player(name: "Sean", number: 7, year: 11, team: "Home"))
        
    }
    
    @objc func updateTime() {
        timerLabel.text = "\(timeFormatted(AppData.totalTime))"
        if live == true{
            if AppData.totalTime != 0 {
                AppData.totalTime -= 1
            } else {
                timer.invalidate()
            }
        }
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = totalSeconds / 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    @IBAction func startTimer(_ sender: Any) {
        if !timerStarted{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            timerStarted = true
        }
        live = true
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        live = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        awayScoreLabel.text = "\(AppData.awayScore)"
        homeScoreLabel.text = "\(AppData.homeScore)"
    }
    
}
