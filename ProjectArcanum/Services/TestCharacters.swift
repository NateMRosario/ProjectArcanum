//
//  TestCharacters.swift
//  ProjectArcanum
//
//  Created by C4Q on 6/18/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import Foundation
import UIKit
class TestCharacters {
    static func sheet() -> [CharacterSheet] {
        var players = [CharacterSheet]()
        
        var charClass = [CharacterClass]()
        charClass.append(CharacterClass(className: "Barbarian", level: 1))
        charClass.append(CharacterClass(className: "Druid", level: 1))
        charClass.append(CharacterClass(className: "Rogue", level: 1))
        
        var stats = [Stats]()
        stats.append(Stats(strength: 20, dexterity: 14, constitution: 16, intelligence: 8, wisdom: 10, charisma: 12))
        stats.append(Stats(strength: 10, dexterity: 15, constitution: 16, intelligence: 10, wisdom: 20, charisma: 13))
        stats.append(Stats(strength: 12, dexterity: 20, constitution: 15, intelligence: 13, wisdom: 16, charisma: 4))
        
        players.append(CharacterSheet(characterImage: nil, name: "Vokiir", race: "Half-Orc", charClass: [charClass[0]], stats: [stats[0]], proficiency: 2, speed: 30, armorClass: 10 + GameMechanic.manager.statModifier(stat: stats[0].dexterity) + GameMechanic.manager.statModifier(stat: stats[0].constitution), currentHp: 15, maxHp: 15, tempHp: 0, passivePerception: 12, condition: nil))
        players.append(CharacterSheet(characterImage: nil, name: "Varis", race: "Elf", charClass: [charClass[1]], stats: [stats[1]], proficiency: 2, speed: 30, armorClass: 14, currentHp: 12, maxHp: 12, tempHp: 0, passivePerception: 17, condition: nil))
        players.append(CharacterSheet(characterImage: nil, name: "Methos", race: "Halfling", charClass: [charClass[2]], stats: [stats[2]], proficiency: 2, speed: 25, armorClass: 16, currentHp: 12, maxHp: 12, tempHp: 0, passivePerception: 13, condition: nil))
        
        return players
    }
    
    
}
