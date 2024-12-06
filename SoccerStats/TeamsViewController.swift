//
//  TeamsViewController.swift
//  SoccerStats
//
//  Created by RYAN SPENCER on 11/21/24.
//

import UIKit

class TeamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var teamTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        teamTable.dataSource = self
        teamTable.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        teamTable.reloadData()
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppData.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = AppData.teams[indexPath.row].name
        cell.detailTextLabel?.text = "\(AppData.teams[indexPath.row].wins)-\(AppData.teams[indexPath.row].losses)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            AppData.teams.remove(at: indexPath.row)
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(AppData.teams) { UserDefaults.standard.set(encoded, forKey: "teams")
            }
            teamTable.reloadData()
        }
    }
    
    @IBAction func unwindT(_ seg: UIStoryboardSegue){
        
        print("unwind")
        teamTable.reloadData()
        
    }
    

}
