//
//  DiceRollerViewController.swift
//  ProjectArcanum
//
//  Created by C4Q on 6/7/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import UIKit

class DiceRollerViewController: UIViewController {
    
    let diceView = DiceRoller()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(diceView)
        diceView.diceButton.addTarget(self, action: #selector(diceButtonPressed), for: .touchUpInside)
        self.view.backgroundColor = .clear
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        for _ in 1...3 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.diceRoll()
                self.setNeedsFocusUpdate()
            }
        }
    }
    @objc private func diceButtonPressed() {
        for _ in 1...3 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.diceRoll()
            }
        }
        print("Clicked")
    }
    private func diceRoll() {
        self.diceView.totalLabel.text = Dice.roll.d20().description
    }

}
