//
//  CharactersTVCell.swift
//  ProjectArcanum
//
//  Created by C4Q on 5/22/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import UIKit

class CharactersTVCell: UITableViewCell {
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(sheet: CharacterSheet) {
        playerImage.image = nil //TODO: set image
        nameLabel.text = sheet.name
        infoLabel.text = ("\(sheet.race) \(sheet.charClass.first?.className ?? "") \(sheet.charClass.first?.level ?? 0)")
        
    }

}
