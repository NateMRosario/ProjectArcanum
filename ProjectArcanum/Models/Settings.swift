//
//  Settings.swift
//  ProjectArcanum
//
//  Created by C4Q on 4/24/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import Foundation
import UIKit

class Settings {
    private init() {}
    static let manager = Settings()
    
    let globalColor = UIColor(displayP3Red: 60/255, green: 78/255, blue: 102/255, alpha: 1)
    let globalDetailFont = UIFont(name: "Papyrus", size: 18)
    let globalTitleFont = UIFont(name: "Papyrus", size: 32)
    
    lazy var appName: UILabel = {
        let label = UILabel()
        label.font = globalTitleFont
        label.text = "Fr0st's DnD Codex"
        label.textColor = .lightGray
        return label
    }()
}
