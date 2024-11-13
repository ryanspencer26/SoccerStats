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
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playerPicker.delegate = self
        playerPicker.dataSource = self
        
        for player in AppData.players{
            pickerData.append(player.name)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presentingViewController?.viewWillAppear(true)
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
        if segmentControl.selectedSegmentIndex == 0 {
            AppData.players[playerPicker.selectedRow(inComponent: 0)].shots += 1
            if AppData.players[playerPicker.selectedRow(inComponent: 0)].team == "Home"{
                AppData.homeShots += 1
            } else {
                AppData.awayShots += 1
            }
        } else if segmentControl.selectedSegmentIndex == 1 {
            AppData.players[playerPicker.selectedRow(inComponent: 0)].shotsOnGoal += 1
            AppData.players[playerPicker.selectedRow(inComponent: 0)].shots += 1
            if AppData.players[playerPicker.selectedRow(inComponent: 0)].team == "Home"{
                AppData.homeSOG += 1
                AppData.homeShots += 1
            } else {
                AppData.awaySOG += 1
                AppData.awayShots += 1
            }
        } else if segmentControl.selectedSegmentIndex == 2 {
            AppData.players[playerPicker.selectedRow(inComponent: 0)].saves += 1
            if AppData.players[playerPicker.selectedRow(inComponent: 0)].team == "Home"{
                AppData.homeSaves += 1
            } else {
                AppData.awaySaves += 1
            }
        } else {
            if AppData.players[playerPicker.selectedRow(inComponent: 0)].team == "Home"{
                AppData.homeCorners += 1
            } else {
                AppData.awayCorners += 1
            }
        }
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.players) { UserDefaults.standard.set(encoded, forKey: "players")
        }
        self.dismiss(animated: true)
    }
    
}
