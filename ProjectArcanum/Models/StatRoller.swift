//
//  StatRoller.swift
//  ProjectArcanum
//
//  Created by C4Q on 4/20/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import Foundation

class StatsGenerator {
    private init() {}
    static let manager = StatsGenerator()
    
    public func numbersForStats() -> [Int] {
        var sixNumbers = [Int]()
        for _ in 1...6 {
            sixNumbers.append(statRandomizer())
        }
        return sixNumbers
    }
    
    private func statRandomizer() -> Int {
        var currentRoll = 0
        var baseRoll = 0
        var total = 0
        for _ in 0..<4 {
            print(baseRoll, currentRoll)
            if baseRoll == 0 {
                baseRoll = Dice.roll.d6()
                continue
            }
            currentRoll = Dice.roll.d6()
            if baseRoll < currentRoll {
                total += currentRoll
            } else {
                total += baseRoll
                baseRoll = currentRoll
            }
        }
        return total
    }
}
