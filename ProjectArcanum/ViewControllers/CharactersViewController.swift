//
//  CharactersViewController.swift
//  ProjectArcanum
//
//  Created by C4Q on 5/22/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {

    var players = TestCharacters.sheet()
    var diceVC = DiceRollerViewController()
    
    @IBOutlet weak var charTableView: UITableView!
    @IBAction func createButtonPressed(_ sender: UIButton) {
        present(diceVC, animated: true, completion: nil)
        diceVC.modalPresentationStyle = .overCurrentContext
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charTableView.dataSource = self
        charTableView.delegate = self
    }
}
extension CharactersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharCell", for: indexPath) as! CharactersTVCell
        let character = players[indexPath.row]
        cell.configureCell(sheet: character)
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CharacterSheetViewController {
            let selectedRow = charTableView.indexPathForSelectedRow!.row
            destination.player = players[selectedRow]
        }
    }
}
