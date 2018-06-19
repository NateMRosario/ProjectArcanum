//
//  CharacterAbilitiesViewController.swift
//  ProjectArcanum
//
//  Created by C4Q on 5/27/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import UIKit

class CharacterSkillsViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    let sheet = CharacterSheetViewController()
    var player: CharacterSheet!
    
    var skillArray = [(name: String, ability: String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        setupSkills()
        self.player = PlayerManager.shared.setPlayer()
    }
    
    private func setupSkills() {
        skillArray.append((name: "Acrobatics", ability: "Dex"))
        skillArray.append((name: "Animal Handling", ability: "Wis"))
        skillArray.append((name: "Arcana", ability: "Int"))
        skillArray.append((name: "Athletics", ability: "Str"))
        skillArray.append((name: "Deception", ability: "Cha"))
        skillArray.append((name: "History", ability: "Int"))
        skillArray.append((name: "Insight", ability: "Wis"))
        skillArray.append((name: "Intimidation", ability: "Cha"))
        skillArray.append((name: "Investigation", ability: "Int"))
        skillArray.append((name: "Medicine", ability: "Wis"))
        skillArray.append((name: "Nature", ability: "Int"))
        skillArray.append((name: "Perception", ability: "Wis"))
        skillArray.append((name: "Performance", ability: "Cha"))
        skillArray.append((name: "Persuasion", ability: "Cha"))
        skillArray.append((name: "Religion", ability: "Int"))
        skillArray.append((name: "Sleight of Hand", ability: "Dex"))
        skillArray.append((name: "Stealth", ability: "Dex"))
        skillArray.append((name: "Survival", ability: "Wis"))
    }

}
extension CharacterSkillsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skillArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AbilityCell", for: indexPath)
        let skill = skillArray[indexPath.row]
        cell.textLabel?.text = skill.name
        switch skill.ability {
        case "Str":
            cell.detailTextLabel?.text = GameMechanic.manager.statModifier(stat: player.stats[0].strength).description
        case "Dex":
            cell.detailTextLabel?.text = GameMechanic.manager.statModifier(stat: player.stats[0].dexterity).description
        case "Int":
            cell.detailTextLabel?.text = GameMechanic.manager.statModifier(stat: player.stats[0].intelligence).description
        case "Wis":
            cell.detailTextLabel?.text = GameMechanic.manager.statModifier(stat: player.stats[0].wisdom).description
        case "Cha":
            cell.detailTextLabel?.text = GameMechanic.manager.statModifier(stat: player.stats[0].charisma).description
        default:
            break
        }
        return cell
    }
}
