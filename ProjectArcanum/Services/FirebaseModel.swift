//
//  FirebaseModel.swift
//  ProjectArcanum
//
//  Created by C4Q on 4/24/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import Foundation
import UIKit

typealias charSheetUID = String
typealias userUID = String
typealias roomUID = String

struct CurrentUser: Codable {
    let name: String
    let isDM: Bool?
    let charSheet: [charSheetUID]?
    let gameRooms: [roomUID]?
    func userToJson() -> Any {
        let jsonData = try! JSONEncoder().encode(self)
        return try! JSONSerialization.jsonObject(with: jsonData, options: [])
    }
}

struct GameRoom: Codable {
    let players: [userUID]?
    let rounds: Int
    let isEnemy: Bool?
    func roomToJson() -> Any {
        let jsonData = try! JSONEncoder().encode(self)
        return try! JSONSerialization.jsonObject(with: jsonData, options: [])
    }
}

///Character Sheet
struct CharacterSheet: Codable {
    let characterImage: String?
    let name: String
    let race: String
    let charClass: [CharacterClass]
    let stats: [Stats]
    let proficiency: Int
    let speed: Int
    let armorClass: Int
    let currentHp: Int
    let maxHp: Int
    let tempHp: Int
    let passivePerception: Int
    let condition: [String]?
    func sheetToJson() -> Any {
        let jsonData = try! JSONEncoder().encode(self)
        return try! JSONSerialization.jsonObject(with: jsonData, options: [])
    }
}
struct CharacterClass: Codable {
    let className: String
    let level: Int
}
struct Stats: Codable {
    let strength: Int
    let dexterity: Int
    let constitution: Int
    let intelligence: Int
    let wisdom: Int
    let charisma: Int
    func toArray() -> [Int] {
        return [strength, dexterity, constitution, intelligence, wisdom, charisma]
    }
}


