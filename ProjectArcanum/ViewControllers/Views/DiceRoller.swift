//
//  DiceRoller.swift
//  ProjectArcanum
//
//  Created by C4Q on 5/25/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import UIKit

class DiceRoller: UIView {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Settings.manager.globalTitleFont
        label.textColor = .black
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.font = Settings.manager.globalDetailFont
        label.textColor = .black
        return label
    }()
    
    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.font = Settings.manager.globalTitleFont
        label.textColor = .black
        return label
    }()
    
    lazy var numbersRolled: UILabel = {
        let label = UILabel()
        label.font = Settings.manager.globalDetailFont
        label.textColor = .black
        return label
    }()
    
    lazy var diceButton: UIButton = {
        let button = UIButton()
        button.imageView?.image = #imageLiteral(resourceName: "dd-dice-512")
        button.imageView?.tintColor = .brown
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        backgroundColor = .clear
        addSubview(containerView)
        addSubview(headerView)
        addSubview(titleLabel)
        addSubview(detailLabel)
        setupViews()
    }
    private func setupViews() {
        let viewObjects = [totalLabel, numbersRolled, diceButton] as [UIView]
        viewObjects.forEach{addSubview($0); $0.snp.makeConstraints({ (make) in
            make.centerX.equalTo(containerView)
        })}
        
        containerView.snp.makeConstraints { (make) in
            make.height.equalTo(self).multipliedBy(0.5)
            make.width.equalTo(self).multipliedBy(0.8)
            make.center.equalTo(self)
        }
        
        headerView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(containerView)
            make.height.equalTo(containerView).multipliedBy(0.25)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.leading.equalTo(headerView).offset(10)
        }
        detailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel).offset(5)
            make.leading.equalTo(headerView).offset(10)
        }
        
        totalLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headerView)
        }
        
        numbersRolled.snp.makeConstraints { (make) in
            make.top.equalTo(totalLabel)
        }
        
        diceButton.snp.makeConstraints { (make) in
            make.top.equalTo(numbersRolled)
        }
        
        
    }

}
