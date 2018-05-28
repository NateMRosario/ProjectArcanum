//
//  CharactersViewController.swift
//  ProjectArcanum
//
//  Created by C4Q on 5/22/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {

    var testArr = ["Vokiir", "Methos", "Varis"]
    
    @IBOutlet weak var charTableView: UITableView!
    @IBAction func createButtonPressed(_ sender: UIButton) {
        self.view.addSubview(DiceRoller())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charTableView.dataSource = self
        charTableView.delegate = self

    }

    
}
extension CharactersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharCell", for: indexPath)
        let char = testArr[indexPath.row]
        cell.textLabel?.text = char
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}
