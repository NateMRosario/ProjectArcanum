//
//  Dice.swift
//  ProjectArcanum
//
//  Created by C4Q on 4/20/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import Foundation

//enum DiceList: String {
//    case d4, d6, d8, d10, d12, d20, d100
//}

class Dice {
    private init() {}
    static let roll = Dice()
    
    public func d4() -> Int {
        return Int(arc4random_uniform(4) + 1)
    }
    public func d6() -> Int {
        return Int(arc4random_uniform(6) + 1)
    }
    public func d8() -> Int {
        return Int(arc4random_uniform(8) + 1)
    }
    public func d10() -> Int {
        return Int(arc4random_uniform(10) + 1)
    }
    public func d12() -> Int {
        return Int(arc4random_uniform(12) + 1)
    }
    public func d20() -> Int {
        return Int(arc4random_uniform(20) + 1)
    }
    public func d100() -> Int {
        return Int(arc4random_uniform(100) + 1)
    }
    
//    public func select(_ dice: DiceList) -> Int {
//        switch dice {
//        case .d4:
//            return d4()
//        case .d6:
//            return d6()
//        case .d8:
//            return d8()
//        case .d10:
//            return d10()
//        case .d12:
//            return d12()
//        case .d20:
//            return d20()
//        case .d100:
//            return d100()
//        }
//    }
}
