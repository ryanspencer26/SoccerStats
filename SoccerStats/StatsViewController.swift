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
        for player in AppData.players{
            pickerData.append(player.name)
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
        AppData.players[playerPicker.selectedRow(inComponent: 0)].goals += 1
        if segmentControl.selectedSegmentIndex == 0{
            AppData.homeScore += 1
        } else {
            AppData.awayScore += 1
        }
        self.dismiss(animated: true)
    }
    
}
