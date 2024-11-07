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
        print("view will appear")
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppData.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = AppData.players[indexPath.row].name
        cell.detailTextLabel?.text = "\(AppData.players[indexPath.row].number)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            AppData.players.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    @IBAction func refresh(_ sender: Any) {
        tableView.reloadData()
    }
    
}
