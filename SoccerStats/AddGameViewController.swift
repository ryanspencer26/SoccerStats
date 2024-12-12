//
//  AddGameViewController.swift
//  SoccerStats
//
//  Created by Ryan Spencer on 11/11/24.
//

import UIKit

class AddGameViewController: UIViewController {
    
    @IBOutlet weak var homeGoalsLabel: UILabel!
    @IBOutlet weak var homeShotsLabel: UILabel!
    @IBOutlet weak var homeSOGLabel: UILabel!
    @IBOutlet weak var homeSavesLabel: UILabel!
    @IBOutlet weak var homeCornersLabel: UILabel!
    
    @IBOutlet weak var awayGoalsLabel: UILabel!
    @IBOutlet weak var awayShotsLabel: UILabel!
    @IBOutlet weak var awaySOGLabel: UILabel!
    @IBOutlet weak var awaySavesLabel: UILabel!
    @IBOutlet weak var awayCornersLabel: UILabel!
    
    @IBOutlet weak var homeGoalStepper: UIStepper!
    @IBOutlet weak var homeShotStepper: UIStepper!
    @IBOutlet weak var homeSOGStepper: UIStepper!
    @IBOutlet weak var homeSaveStepper: UIStepper!
    @IBOutlet weak var homeCornerStepper: UIStepper!
    
    @IBOutlet weak var awayGoalStepper: UIStepper!
    @IBOutlet weak var awayShotStepper: UIStepper!
    @IBOutlet weak var awaySOGStepper: UIStepper!
    @IBOutlet weak var awaySaveStepper: UIStepper!
    @IBOutlet weak var awayCornerStepper: UIStepper!
    
    @IBOutlet weak var awayPopUp: UIButton!
    @IBOutlet weak var homePopUp: UIButton!
    
    var homeName: String!
    var awayName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        homeGoalStepper.value = 0
        homeGoalStepper.minimumValue = 0
        homeGoalStepper.stepValue = 1
        homeShotStepper.value = 0
        homeShotStepper.minimumValue = 0
        homeShotStepper.stepValue = 1
        homeSOGStepper.value = 0
        homeSOGStepper.minimumValue = 0
        homeSOGStepper.stepValue = 1
        homeSaveStepper.value = 0
        homeSaveStepper.minimumValue = 0
        homeSaveStepper.stepValue = 1
        homeCornerStepper.value = 0
        homeCornerStepper.minimumValue = 0
        homeCornerStepper.stepValue = 1
        
        awayGoalStepper.value = 0
        awayGoalStepper.minimumValue = 0
        awayGoalStepper.stepValue = 1
        awayShotStepper.value = 0
        awayShotStepper.minimumValue = 0
        awayShotStepper.stepValue = 1
        awaySOGStepper.value = 0
        awaySOGStepper.minimumValue = 0
        awaySOGStepper.stepValue = 1
        awaySaveStepper.value = 0
        awaySaveStepper.minimumValue = 0
        awaySaveStepper.stepValue = 1
        awayCornerStepper.value = 0
        awayCornerStepper.minimumValue = 0
        awayCornerStepper.stepValue = 1
        
        setHomePopUpButton()
        setAwayPopUpButton()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        performSegue(withIdentifier: "unwindGame", sender: self)
    }
    
    @IBAction func tapRecognized(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func homeGoalStep(_ sender: Any) {
        updateScreen()
    }
    
    @IBAction func homeShotStep(_ sender: Any) {
        updateScreen()
    }
    
    @IBAction func homeSOGStep(_ sender: Any) {
        updateScreen()
    }
    
    @IBAction func homeSaveStep(_ sender: Any) {
        updateScreen()
    }
    
    @IBAction func homeCornerStep(_ sender: Any) {
        updateScreen()
    }
    
    @IBAction func awayGoalStep(_ sender: Any) {
        updateScreen()
    }
    
    @IBAction func awayShotStep(_ sender: Any) {
        updateScreen()
    }
    
    @IBAction func awaySOGStep(_ sender: Any) {
        updateScreen()
    }
    
    @IBAction func awaySaveStep(_ sender: Any) {
        updateScreen()
    }
    
    @IBAction func awayCornerStep(_ sender: Any) {
        updateScreen()
    }
    
    func setHomePopUpButton(){
        
        // create the closure
        let optionClosure = {(action: UIAction) in
            self.homeName = action.title
        }

        // create an array to store the actions
        var optionsArray = [UIAction]()

        // loop and populate the actions array
        for team in AppData.teams {
            let action = UIAction(title: team.name, handler: optionClosure)
                    
            // add newly created action to actions array
            optionsArray.append(action)
        }
        
        optionsArray.insert(UIAction(title: "Pick Team", handler: optionClosure), at: 0)
        
        optionsArray[0].state = .on

        // create an options menu
        let optionsMenu = UIMenu(title: "Home", options: .displayInline, children: optionsArray)
                
        // add everything to your button
        homePopUp.menu = optionsMenu

        // make sure the popup button shows the selected value
        homePopUp.changesSelectionAsPrimaryAction = true
        homePopUp.showsMenuAsPrimaryAction = true
        
    }
    
    func setAwayPopUpButton(){
        
        // create the closure
        let optionClosure = {(action: UIAction) in
            self.awayName = action.title
        }

        // create an array to store the actions
        var optionsArray = [UIAction]()

        // loop and populate the actions array
        for team in AppData.teams {
            let action = UIAction(title: team.name, handler: optionClosure)
                    
            // add newly created action to actions array
            optionsArray.append(action)
        }
        
        optionsArray.insert(UIAction(title: "Pick Team", handler: optionClosure), at: 0)
        
        optionsArray[0].state = .on

        // create an options menu
        let optionsMenu = UIMenu(title: "Away", options: .displayInline, children: optionsArray)
                
        // add everything to your button
        awayPopUp.menu = optionsMenu

        // make sure the popup button shows the selected value
        awayPopUp.changesSelectionAsPrimaryAction = true
        awayPopUp.showsMenuAsPrimaryAction = true
        
    }
    
    func updateScreen(){
        homeGoalsLabel.text = "\(Int(homeGoalStepper.value)) goals"
        homeShotsLabel.text = "\(Int(homeShotStepper.value)) shots"
        homeSOGLabel.text = "\(Int(homeSOGStepper.value)) shots on goal"
        homeSavesLabel.text = "\(Int(homeSaveStepper.value)) saves"
        homeCornersLabel.text = "\(Int(homeCornerStepper.value)) corners"
        
        awayGoalsLabel.text = "\(Int(awayGoalStepper.value)) goals"
        awayShotsLabel.text = "\(Int(awayShotStepper.value)) shots"
        awaySOGLabel.text = "\(Int(awaySOGStepper.value)) shots on goal"
        awaySavesLabel.text = "\(Int(awaySaveStepper.value)) saves"
        awayCornersLabel.text = "\(Int(awayCornerStepper.value)) corners"
    }
    
    @IBAction func saveGame(_ sender: Any) {
        if homeName != "Pick Team" && awayName != "Pick Team" && homeName != awayName {
            AppData.games.append(Game(homeTeam: homeName, awayTeam: awayName, homeScore: Int(homeGoalStepper.value), awayScore: Int(awayGoalStepper.value), homeShots: Int(homeShotStepper.value), awayShots: Int(awayShotStepper.value), homeSOG: Int(homeSOGStepper.value), awaySOG: Int(awaySOGStepper.value), homeSaves: Int(homeSaveStepper.value), awaySaves: Int(awaySaveStepper.value), homeCorners: Int(homeCornerStepper.value), awayCorners: Int(awayCornerStepper.value)))
            // save to userDefaults
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(AppData.games) { UserDefaults.standard.set(encoded, forKey: "games")
            }
            self.dismiss(animated: true)
        }
        // alert user invalid input
    }
    
    
    
}
