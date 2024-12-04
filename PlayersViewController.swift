//
//  PlayersViewController.swift
//  SoccerStats
//
//  Created by RYAN SPENCER on 11/4/24.
//

import UIKit

class PlayersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppData.players.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppData.index = indexPath.row
        performSegue(withIdentifier: "playerInfoSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = "#\(AppData.players[indexPath.row].number) \(AppData.players[indexPath.row].name)"
        cell.detailTextLabel?.text = "\(AppData.players[indexPath.row].team)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            AppData.players.remove(at: indexPath.row)
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(AppData.players) { UserDefaults.standard.set(encoded, forKey: "players")
            }
            tableView.reloadData()
        }
    }
    
    @IBAction func unwind(_ seg: UIStoryboardSegue){
        print("unwind")
        tableView.reloadData()
    }
    
}
