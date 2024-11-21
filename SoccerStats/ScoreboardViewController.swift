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
    @IBOutlet weak var awayShotLabel: UILabel!
    @IBOutlet weak var awaySOGLabel: UILabel!
    @IBOutlet weak var awaySaveLabel: UILabel!
    @IBOutlet weak var awayCornerLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var homeShotLabel: UILabel!
    @IBOutlet weak var homeSOGLabel: UILabel!
    @IBOutlet weak var homeSaveLabel: UILabel!
    @IBOutlet weak var homeCornerLabel: UILabel!
    @IBOutlet weak var homePopUp: UIButton!
    @IBOutlet weak var awayPopUp: UIButton!
    
    var gameOver: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var availableTeams = AppData.teams
        
//        // create the closure
//        let optionClosure = {(action: UIAction) in
//                    print(action.title)
//                }
//        
//        // create an array to store the actions
//        var optionsArray = [UIAction]()
//
//        // loop and populate the actions array
//        for team in availableTeams {
//            // create each action and insert the right country as a title
//            let action = UIAction(title: team.name, state: .off, handler: optionClosure)
//                    
//            // add newly created action to actions array
//            optionsArray.append(action)
//        }
//                
//                
//        // set the state of first country in the array as ON
//        optionsArray[0].state = .on
//
//        // create an options menu
//        let optionsMenu = UIMenu(title: "", options: .displayInline, children: optionsArray)
//                
//        // add everything to your button
//        homePopUp.menu = optionsMenu
//        awayPopUp.menu = optionsMenu
//
//        // make sure the popup button shows the selected value
//        homePopUp.changesSelectionAsPrimaryAction = true
//        homePopUp.showsMenuAsPrimaryAction = true
        
    }
    
    @objc func updateTime() {
        if live == true{
            if AppData.totalTime != 0 {
                AppData.totalTime -= 1
            } else {
                timer.invalidate()
                gameOver = true
            }
        }
        timerLabel.text = "\(timeFormatted(AppData.totalTime))"
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = totalSeconds / 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    @IBAction func addGoalAction(_ sender: Any) {
        if !timerStarted {
            let alert = UIAlertController(title: "Error", message: "Game not started", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        if AppData.players.count >= 4{
            var homePlayers = 0
            var awayPlayers = 0
            for player in AppData.players{
                if player.team == "Home"{
                    homePlayers += 1
                } else {
                    awayPlayers += 1
                }
            }
            if homePlayers >= 2 && awayPlayers >= 2{
                performSegue(withIdentifier: "addGoalSegue", sender: self)
                return
            }
        }
        let alert = UIAlertController(title: "Error", message: "You must have 2+ players registered for each team.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func editStatAction(_ sender: Any) {
        if !timerStarted {
            let alert = UIAlertController(title: "Error", message: "Game not started", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        if AppData.players.count >= 4{
            var homePlayers = 0
            var awayPlayers = 0
            for player in AppData.players{
                if player.team == "Home"{
                    homePlayers += 1
                } else {
                    awayPlayers += 1
                }
            }
            if homePlayers >= 2 && awayPlayers >= 2{
                performSegue(withIdentifier: "editStatSegue", sender: self)
                return
            }
        }
        let alert = UIAlertController(title: "Error", message: "You must have 2+ players registered for each team.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
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
        awayShotLabel.text = "\(AppData.awayShots)"
        homeShotLabel.text = "\(AppData.homeShots)"
        awaySOGLabel.text = "\(AppData.awaySOG)"
        homeSOGLabel.text = "\(AppData.homeSOG)"
        awaySaveLabel.text = "\(AppData.awaySaves)"
        homeSaveLabel.text = "\(AppData.homeSaves)"
        awayCornerLabel.text = "\(AppData.awayCorners)"
        homeCornerLabel.text = "\(AppData.homeCorners)"
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        if gameOver{
            saveGame()
        } else {
            let alert = UIAlertController(title: "Warning", message: "The game is not finished. Are you sure you want to save the current game?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .destructive) { (action) in
                self.saveGame()
                self.live = false
                AppData.totalTime = 5400
            }
            let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
            alert.addAction(yesAction)
            alert.addAction(noAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func saveGame(){
        AppData.games.append(Game(homeScore: AppData.homeScore, awayScore: AppData.awayScore, homeShots: AppData.homeSaves, awayShots: AppData.awayShots, homeSOG: AppData.homeSOG, awaySOG: AppData.awaySOG, homeSaves: AppData.homeSaves, awaySaves: AppData.awaySaves, homeCorners: AppData.homeCorners, awayCorners: AppData.awayCorners))
        // save to userDefaults
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.games) { UserDefaults.standard.set(encoded, forKey: "games")
        }
        print("game saved")
        AppData.homeScore = 0
        AppData.awayScore = 0
        AppData.homeShots = 0
        AppData.awayShots = 0
        AppData.homeSOG = 0
        AppData.awaySOG = 0
        AppData.homeSaves = 0
        AppData.awaySaves = 0
        AppData.homeCorners = 0
        AppData.awayCorners = 0
    }
    
    @IBAction func homePopUpAction(_ sender: Any) {
        
        
        
    }
    
    @IBAction func awayPopUpAction(_ sender: Any) {
        
        
        
    }
    
}
