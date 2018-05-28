//
//  CharacterSkillsViewController.swift
//  ProjectArcanum
//
//  Created by C4Q on 5/27/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import UIKit

class CharacterSkillsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }


}
extension CharacterSkillsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCell", for: indexPath)
        cell.textLabel?.text = "Skills"
        return cell
    }
}
