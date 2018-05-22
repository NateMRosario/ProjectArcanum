//
//  SignUp.swift
//  ProjectArcanum
//
//  Created by C4Q on 4/24/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import Foundation
import UIKit

class SignUp: UIView {
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = [UIColor.lightGray.cgColor, UIColor(displayP3Red: 60/255, green: 78/255, blue: 102/255, alpha: 1)]
        return gradient
    }()
    
    lazy var diceImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "dd-dice-512")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Settings.manager.globalTitleFont
        label.text = "Fr0st's Codex"
        label.textColor = .black
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        tf.textColor = .white
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        return tf
    }()
    lazy var nameLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        tf.textColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        return tf
    }()
    lazy var emailLine : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        tf.textColor = .white
        tf.isSecureTextEntry = true
        return tf
    }()
    let passwordLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var confirmPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Confirm Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        tf.textColor = .white
        tf.isSecureTextEntry = true
        return tf
    }()
    let confirmLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var buttonBackground: UIView = {
        let view = UIView()
        let gradient = CAGradientLayer()
        let bottomColor = UIColor(red: 84/255.0, green: 180/255.0, blue: 225/255.0, alpha: 1).cgColor
        let topColor = UIColor(red: 100/255.0, green: 190/255.0, blue: 180/255.0, alpha: 1).cgColor
        let gradientColors = [topColor, bottomColor]
        let gradientLocations: [NSNumber] = [0.0, 1.0]
        gradient.colors = gradientColors
        gradient.frame = CGRect(x: 0, y: 0, width: 300, height: 35)
        gradient.locations = gradientLocations
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.cornerRadius = 5.0
        gradient.masksToBounds = true
        view.layer.insertSublayer(gradient, at: 0)
        return view
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Settings.manager.globalDetailFont
        button.setTitle("SIGN UP", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Settings.manager.globalDetailFont
        button.setTitle("Already have an account?", for: .normal)
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
        backgroundColor = Settings.manager.globalColor
        layer.addSublayer(gradientLayer)
        addSubview(diceImage)
        addSubview(buttonBackground)
        addSubview(nameLine)
        addSubview(emailLine)
        addSubview(passwordLine)
        addSubview(confirmLine)
        setupViews()
    }
    private func setupViews() {
        let viewObjects = [titleLabel, nameTextField, emailTextField, passwordTextField, confirmPasswordTextField, signUpButton, backButton] as [UIView]
        viewObjects.forEach{addSubview($0); $0.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self)
        })}
        let padding = 20
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(padding + 20)
            make.height.equalTo(padding + 20)
        }
        
        diceImage.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(titleLabel.snp.bottom).offset(padding - 10)
            make.width.height.equalTo(self).multipliedBy(0.25)
        }
        
        nameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(diceImage.snp.bottom).offset(padding)
            make.width.equalTo(self).multipliedBy(0.8)
        }
        nameLine.snp.makeConstraints { (make) in
            make.top.equalTo(nameTextField.snp.bottom).offset(1)
            make.centerX.equalTo(self)
            make.width.equalTo(nameTextField)
            make.height.equalTo(1)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(nameTextField.snp.bottom).offset(padding)
            make.width.equalTo(nameTextField)
        }
        emailLine.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom).offset(1)
            make.centerX.equalTo(self)
            make.width.equalTo(nameTextField)
            make.height.equalTo(1)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom).offset(padding)
            make.width.equalTo(nameTextField)
        }
        passwordLine.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(1)
            make.centerX.equalTo(self)
            make.width.equalTo(nameTextField)
            make.height.equalTo(1)
        }
        
        confirmPasswordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(padding)
            make.width.equalTo(nameTextField)
        }
        confirmLine.snp.makeConstraints { (make) in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(1)
            make.centerX.equalTo(self)
            make.width.equalTo(nameTextField)
            make.height.equalTo(1)
        }
        
        signUpButton.snp.makeConstraints { (make) in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(padding)
            make.width.equalTo(nameTextField)
        }
        
        buttonBackground.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(padding)
            make.width.height.equalTo(signUpButton)
        }
        
        backButton.snp.makeConstraints { (make) in
            make.top.equalTo(signUpButton.snp.bottom).offset(padding)
            make.width.equalTo(nameTextField)
        }
        
    }
    
}
