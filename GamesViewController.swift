//
//  GamesViewController.swift
//  SoccerStats
//
//  Created by Ryan Spencer on 11/11/24.
//

import UIKit

class GamesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppData.games.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = "Home vs Away"
        cell.detailTextLabel?.text = "\(AppData.games[indexPath.row].homeScore)-\(AppData.games[indexPath.row].awayScore)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            AppData.games.remove(at: indexPath.row)
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(AppData.games) { UserDefaults.standard.set(encoded, forKey: "games")
            }
            tableView.reloadData()
        }
    }
    
}
