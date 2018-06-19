//
//  CharacterSheetViewController.swift
//  ProjectArcanum
//
//  Created by C4Q on 5/22/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import UIKit
import Parchment
class PlayerManager {
    private init() {}
    static let shared = PlayerManager()
    var sheet: CharacterSheet!
    func setPlayer() -> CharacterSheet {
        return self.sheet
    }
    func getPlayer(sheet: CharacterSheet) {
        self.sheet = sheet
    }
}
class CharacterSheetViewController: UIViewController {
    
    @IBOutlet weak var charImageView: UIImageView!
    
    @IBOutlet weak var charPotrait: UIImageView!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var greenHP: UIView!
    @IBOutlet weak var charName: UILabel!
    @IBOutlet weak var charRaceClass: UILabel!
    
    //Passives
    @IBOutlet weak var proficiencyLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var armorLabel: UILabel!
    @IBOutlet weak var initiativeLabel: UILabel!
    @IBOutlet weak var passivePerceptionLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Let the setup commence
    let storyBoardName = "CharacterSheet"
    let statsArray = ["STRENGTH","DEXTERITY","CONSTITUTION","INTELLIGENCE","WISDOM","CHARISMA"]
    let statNumbers = [19,12,16,8,10,11]
    
    var player: CharacterSheet! {
        didSet {
            PlayerManager.shared.getPlayer(sheet: player)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        settingUpPaging()
        loadPlayer()
    }
    
    private func loadPlayer() {
        switch player.name {
        case "Vokiir":
            charPotrait.image = #imageLiteral(resourceName: "barbarian")
        case "Varis":
            charPotrait.image = #imageLiteral(resourceName: "druid")
        case "Methos":
            charPotrait.image = #imageLiteral(resourceName: "rogue")
        default:
            break
        }
        hpLabel.text = "\(player.currentHp) / \(player.maxHp)"
        charName.text = player.name
        //TODO: Handle multiple classes
        charRaceClass.text = "\(player.race) \(player.charClass[0].className) \(player.charClass[0].level)"
        proficiencyLabel.text = player.proficiency.description
        speedLabel.text = player.speed.description
        armorLabel.text = player.armorClass.description
        initiativeLabel.text = GameMechanic.manager.statModifier(stat: player.stats[0].dexterity).description
        passivePerceptionLabel.text = (10 + GameMechanic.manager.statModifier(stat: player.stats[0].wisdom)).description
        
    }
    
    func settingUpPaging() {
        let charSkills = CharacterSkillsViewController.instantiate(withStoryboard: storyBoardName)
        let charAttacks = CharacterAttacksViewController.instantiate(withStoryboard: storyBoardName)
        let charFeatures = CharacterFeaturesViewController.instantiate(withStoryboard: storyBoardName)
        
        charSkills.title = "Abilities"
        charAttacks.title = "Attacks"
        charFeatures.title = "Features"
        
        let pagingViewController = FixedPagingViewController(viewControllers: [charSkills, charAttacks, charFeatures])
        
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
            make.top.equalTo(collectionView.snp.bottom)
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
        return player.stats[0].toArray().count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatsCell", for: indexPath) as! StatsCVCell
        let stat = player.stats[0].toArray()[indexPath.row]
        cell.statName.text = statsArray[indexPath.row]
        cell.statNumber.text = stat.description
        cell.statMod.text = GameMechanic.manager.statModifier(stat: stat).description
        return cell
    }
}

