//
//  TeamInfoViewController.swift
//  SoccerStats
//
//  Created by RYAN SPENCER on 12/4/24.
//

import UIKit

class TeamInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var wlRatio: UILabel!
    @IBOutlet weak var recordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        teamName.text = "\(AppData.teams[AppData.teamIndex].name)"
        wlRatio.text = "W/L Ratio: \(AppData.teams[AppData.teamIndex].wlRatio)"
        recordLabel.text = "\(AppData.teams[AppData.teamIndex].wins)-\(AppData.teams[AppData.teamIndex].losses)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppData.teams[AppData.teamIndex].players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = AppData.teams[AppData.teamIndex].players[indexPath.row].name
        cell.detailTextLabel?.text = "#\(AppData.teams[AppData.teamIndex].players[indexPath.row].number)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppData.playerIndex = indexPath.row
        performSegue(withIdentifier: "playerInfoSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            AppData.teams[AppData.teamIndex].players.remove(at: indexPath.row)
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(AppData.teams) { UserDefaults.standard.set(encoded, forKey: "teams")
            }
            tableView.reloadData()
        }
    }

}
