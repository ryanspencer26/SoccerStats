//
//  EditStatsViewController.swift
//  SoccerStats
//
//  Created by Ryan Spencer on 11/12/24.
//

import UIKit

class EditStatsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var playerPicker: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    var possiblePlayers: [Player] = [Player]()
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playerPicker.delegate = self
        playerPicker.dataSource = self
        
        for team in AppData.teams {
            if team.name == AppData.currentHome || team.name == AppData.currentAway{
                for player in team.players{
                    pickerData.append(player.name)
                    possiblePlayers.append(player)
                }
            }
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        performSegue(withIdentifier: "unwindStats", sender: self)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    @IBAction func submitAction(_ sender: Any) {
        
        switch segmentControl.selectedSegmentIndex {
            
        case 0:
            possiblePlayers[playerPicker.selectedRow(inComponent: 0)].shots += 1
            if possiblePlayers[playerPicker.selectedRow(inComponent: 0)].team == AppData.currentHome {
                AppData.homeShots += 1
            } else {
                AppData.awayShots += 1
            }
            
        case 1:
            possiblePlayers[playerPicker.selectedRow(inComponent: 0)].shotsOnGoal += 1
            possiblePlayers[playerPicker.selectedRow(inComponent: 0)].shots += 1
            if possiblePlayers[playerPicker.selectedRow(inComponent: 0)].team == AppData.currentHome {
                AppData.homeSOG += 1
                AppData.homeShots += 1
                AppData.awaySaves += 1
            } else {
                AppData.awaySOG += 1
                AppData.awayShots += 1
                AppData.homeSaves += 1
            }
        
        case 2:
            possiblePlayers[playerPicker.selectedRow(inComponent: 0)].saves += 1
            if possiblePlayers[playerPicker.selectedRow(inComponent: 0)].team == AppData.currentHome {
                AppData.homeSaves += 1
            } else {
                AppData.awaySaves += 1
            }
            
        case 3:
            if possiblePlayers[playerPicker.selectedRow(inComponent: 0)].team == AppData.currentHome {
                AppData.homeCorners += 1
            } else {
                AppData.awayCorners += 1
            }
            
        case 4:
            possiblePlayers[playerPicker.selectedRow(inComponent: 0)].goals += 1
            possiblePlayers[playerPicker.selectedRow(inComponent: 0)].shots += 1
            possiblePlayers[playerPicker.selectedRow(inComponent: 0)].shotsOnGoal += 1
            if possiblePlayers[playerPicker.selectedRow(inComponent: 0)].team == AppData.currentHome{
                AppData.homeScore += 1
                AppData.homeShots += 1
                AppData.homeSOG += 1
            } else {
                AppData.awayScore += 1
                AppData.awayShots += 1
                AppData.awaySOG += 1
            }
            
        default:
            print("default")
            
        }
        self.dismiss(animated: true)
    }
    
}
