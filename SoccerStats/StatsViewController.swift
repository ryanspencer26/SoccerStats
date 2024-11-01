//
//  StatsViewController.swift
//  SoccerStats
//
//  Created by RYAN SPENCER on 10/28/24.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var statPicker: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for player in AppData.players{
            pickerData.append(player.name)
        }
        
    }

}
