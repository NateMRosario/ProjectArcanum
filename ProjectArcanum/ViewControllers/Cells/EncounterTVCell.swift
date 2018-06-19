//
//  EncounterTVCell.swift
//  ProjectArcanum
//
//  Created by C4Q on 6/18/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import UIKit

class EncounterTVCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lifeBar: UIView!
    @IBOutlet weak var armorLabel: UILabel!
    
    func configureCell(character: CharacterSheet) {
        nameLabel.text = character.name
        armorLabel.text = "Armor Class: \(character.armorClass.description)"
    }

}
