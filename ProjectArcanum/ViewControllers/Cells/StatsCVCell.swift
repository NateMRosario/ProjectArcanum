//
//  StatsCVCell.swift
//  ProjectArcanum
//
//  Created by C4Q on 5/27/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import UIKit

class StatsCVCell: UICollectionViewCell {
    
    @IBOutlet weak var cellContainerView: UIView! {
        didSet {
            cellContainerView.layer.borderWidth = 1
            cellContainerView.layer.cornerRadius = 6
        }
    }
    @IBOutlet weak var statName: UILabel!
    @IBOutlet weak var statMod: UILabel!
    @IBOutlet weak var statNumber: UILabel! {
        didSet {
            statNumber.layer.borderWidth = 1
            statNumber.layer.cornerRadius = 10
        }
    }
}
