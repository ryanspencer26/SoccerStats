//
//  StatsViewController.swift
//  SoccerStats
//
//  Created by RYAN SPENCER on 10/28/24.
//

import UIKit

class StatsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var playerPicker: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerPicker.delegate = self
        playerPicker.dataSource = self

        // Do any additional setup after loading the view.
        if segmentControl.selectedSegmentIndex == 0 {
            for player in AppData.players{
                if player.team == "Home"{
                    pickerData.append(player.name)
                }
            }
        } else {
            for player in AppData.players{
                if player.team == "Away"{
                    pickerData.append(player.name)
                }
            }
        }
        
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presentingViewController?.viewWillAppear(true)
    }

    @IBAction func submit(_ sender: Any) {
        for player in AppData.players {
            if player.name == pickerData[playerPicker.selectedRow(inComponent: 0)]{
                player.goals += 1
                player.shots += 1
                player.shotsOnGoal += 1
                break
            }
        }
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.players) { UserDefaults.standard.set(encoded, forKey: "players")
        }
        if segmentControl.selectedSegmentIndex == 0{
            AppData.homeScore += 1
            AppData.homeShots += 1
            AppData.homeSOG += 1
        } else {
            AppData.awayScore += 1
            AppData.awayShots += 1
            AppData.awaySOG += 1
        }
        self.dismiss(animated: true)
    }
    
    
    @IBAction func indexSwitched(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex
        {
        case 0:
            pickerData = [String]()
            for player in AppData.players{
                if player.team == "Home"{
                    pickerData.append(player.name)
                }
            }
            playerPicker.reloadAllComponents()
        case 1:
            pickerData = [String]()
            for player in AppData.players{
                if player.team == "Away"{
                    pickerData.append(player.name)
                }
            }
            playerPicker.reloadAllComponents()
        default:
            break;
        }
    }
    
}
