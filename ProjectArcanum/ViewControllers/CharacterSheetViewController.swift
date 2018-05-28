//
//  CharacterSheetViewController.swift
//  ProjectArcanum
//
//  Created by C4Q on 5/22/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import UIKit
import Parchment

class CharacterSheetViewController: UIViewController {
    
    @IBOutlet weak var charImageView: UIImageView!
    @IBOutlet weak var charPotrait: UIImageView!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var greenHP: UIView!
    @IBOutlet weak var charName: UILabel!
    @IBOutlet weak var charRaceClass: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Let the setup commence
    let storyBoardName = "CharacterSheet"
    let statsArray = ["STRENGTH","DEXTERITY","CONSTITUTION","INTELLIGENCE","WISDOM","CHARISMA"]
    let statNumbers = [19,12,16,8,10,11]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingUpPaging()
        collectionView.dataSource = self
    }
    
    func settingUpPaging() {
        let charAbilities = CharacterAbilitiesViewController.instantiate(withStoryboard: storyBoardName)
        let charSkills = CharacterSkillsViewController.instantiate(withStoryboard: storyBoardName)
        let charAttacks = CharacterAttacksViewController.instantiate(withStoryboard: storyBoardName)
        let charFeatures = CharacterFeaturesViewController.instantiate(withStoryboard: storyBoardName)
        
        charAbilities.title = "Abilities"
        charSkills.title = "Skills"
        charAttacks.title = "Attacks"
        charFeatures.title = "Features"
        
        let pagingViewController = FixedPagingViewController(viewControllers: [charAbilities, charSkills, charAttacks, charFeatures])
        
        pagingViewController.borderOptions = PagingBorderOptions.visible(height: 1, zIndex: Int.max - 1, insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        pagingViewController.indicatorOptions = PagingIndicatorOptions.visible(height: 5, zIndex: Int.max - 1, spacing: UIEdgeInsets.zero, insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        pagingViewController.menuHorizontalAlignment = .center
        pagingViewController.menuItemSize = PagingMenuItemSize.sizeToFit(minWidth: 50, height: 40)
        pagingViewController.menuInteraction = .none
        pagingViewController.didMove(toParentViewController: self)
        pagingViewController.menuTransition = .scrollAlongside
        
        addChildViewController(pagingViewController)
        view.addSubview(pagingViewController.view)
        /// PagingView Contraints
        pagingViewController.view.snp.makeConstraints { (make) in
            make.top.equalTo(self.collectionView.snp.bottom)
            make.leading.trailing.bottom.equalTo(self.view)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension CharacterSheetViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statsArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatsCell", for: indexPath) as! StatsCVCell
        let stat = statNumbers[indexPath.row]
        cell.statName.text = statsArray[indexPath.row]
        cell.statNumber.text = stat.description
        cell.statMod.text = GameMechanic.manager.statModifier(stat: stat).description
        return cell
    }
}
