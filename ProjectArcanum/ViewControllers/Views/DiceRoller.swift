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
        label.text = "Roll"
        label.font = Settings.manager.globalTitleFont
        label.textColor = .black
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.text = "Ability + Modifier"
        label.font = Settings.manager.globalDetailFont
        label.textColor = .black
        return label
    }()
    
    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.text = "25"
        label.font = Settings.manager.globalTitleFont
        label.textColor = .black
        return label
    }()
    
    lazy var numbersRolled: UILabel = {
        let label = UILabel()
        label.text = "15 + 10"
        label.font = Settings.manager.globalDetailFont
        label.textColor = .black
        return label
    }()
    
    lazy var diceButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "dd-dice-512"), for: .normal)
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
            make.height.equalTo(self).multipliedBy(0.4)
            make.width.equalTo(self).multipliedBy(0.8)
            make.center.equalTo(self)
        }
        
        headerView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(containerView)
            make.height.equalTo(containerView).multipliedBy(0.25)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.top)
            make.leading.equalTo(headerView).offset(10)
        }
        detailLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(headerView.snp.bottom)
            make.leading.equalTo(headerView).offset(10)
        }
        
        totalLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom).offset(25)
        }
        
        numbersRolled.snp.makeConstraints { (make) in
            make.top.equalTo(totalLabel.snp.bottom).offset(5)
        }
        
        diceButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(containerView.snp.bottom).offset(-20)
            make.height.width.equalTo(containerView).multipliedBy(0.18)
        }
    }
}
