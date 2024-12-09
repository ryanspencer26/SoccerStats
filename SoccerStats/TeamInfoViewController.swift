//
//  TeamInfoViewController.swift
//  SoccerStats
//
//  Created by RYAN SPENCER on 12/4/24.
//

import UIKit

class TeamInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppData.teams[AppData.index].players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = AppData.teams[AppData.index].players[indexPath.row].name
        cell.detailTextLabel?.text = "#\(AppData.teams[AppData.index].players[indexPath.row].number)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            AppData.teams[AppData.index].players.remove(at: indexPath.row)
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(AppData.teams) { UserDefaults.standard.set(encoded, forKey: "teams")
            }
            tableView.reloadData()
        }
    }

}
