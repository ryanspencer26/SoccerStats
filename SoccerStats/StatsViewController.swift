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
        
        segmentControl.setTitle(AppData.currentHome, forSegmentAt: 0)
        segmentControl.setTitle(AppData.currentAway, forSegmentAt: 1)
        
        if segmentControl.selectedSegmentIndex == 0 {
            for player in AppData.players{
                if player.team == AppData.currentHome {
                    pickerData.append(player.name)
                }
            }
        } else {
            for player in AppData.players{
                if player.team == AppData.currentAway {
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
        performSegue(withIdentifier: "unwindGoal", sender: self)
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
                if player.team == AppData.currentHome {
                    pickerData.append(player.name)
                }
            }
            playerPicker.reloadAllComponents()
        case 1:
            pickerData = [String]()
            for player in AppData.players{
                if player.team == AppData.currentAway {
                    pickerData.append(player.name)
                }
            }
            playerPicker.reloadAllComponents()
        default:
            break;
        }
    }
    
}
