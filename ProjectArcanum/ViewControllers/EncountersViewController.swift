//
//  EncountersViewController.swift
//  ProjectArcanum
//
//  Created by C4Q on 5/22/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import UIKit

class EncountersViewController: UIViewController {
    
    var players = TestCharacters.sheet()
    var tracker = 1
    var counter = 0 {
        didSet {
            if counter >= players.count  {
                counter = 0
                tracker += 1
                print(tracker)
            }
        }
    }

    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var trackerBackButton: UIButton!
    @IBOutlet weak var encounterTableView: UITableView! {
        didSet {
            encounterTableView.backgroundColor = UIColor.clear
        }
    }
    @IBAction func addEncounterPressed(_ sender: UIButton) {
    }
    
    @IBAction func trackerNextPressed(_ sender: UIButton) {
        let oldIndex = IndexPath(row: counter, section: 0)
        var oldCell = encounterTableView.cellForRow(at: oldIndex) as! EncounterTVCell
        oldCell.backgroundColor = UIColor.clear
        counter += 1
        let index = IndexPath(row: counter, section: 0)
        var cell = encounterTableView.cellForRow(at: index) as! EncounterTVCell
        cell.backgroundColor = UIColor.brown
        turnLabel.text = "Turn: \(tracker.description)"
    }
    @IBAction func trackerBackPressed(_ sender: UIButton) {
        let oldIndex = IndexPath(row: counter, section: 0)
        var oldCell = encounterTableView.cellForRow(at: oldIndex) as! EncounterTVCell
        oldCell.backgroundColor = UIColor.clear
        if counter == 0 && tracker == 1 {
            trackerBackButton.isUserInteractionEnabled = false
        } else if counter == 0 {
            counter = players.count
        }
        let index = IndexPath(row: counter, section: 0)
        var cell = encounterTableView.cellForRow(at: index) as! EncounterTVCell
        cell.backgroundColor = UIColor.brown
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        encounterTableView.dataSource = self
        encounterTableView.delegate = self

    }

}
extension EncountersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EncounterCell", for: indexPath) as! EncounterTVCell
        let player = players[indexPath.row]
        cell.configureCell(character: player)
        return cell
    }
    
}
extension EncountersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) -> Bool {
        let index = IndexPath(row: 0, section: 0)
        var cell = encounterTableView.cellForRow(at: index) as! EncounterTVCell
        cell.backgroundColor = UIColor.brown
        return true
    }
}
