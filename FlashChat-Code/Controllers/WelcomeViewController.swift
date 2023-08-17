//
//  ViewController.swift
//  FlashChat-Code
//
//  Created by iOS - Developer on 16.08.2023.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    //MARK: - UI
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: K.BrandColors.blue)
        label.font = .systemFont(ofSize: 50, weight: .black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - UI

   let loginButton = UIButton(
    titleColor: .white,
    backgroundColor: .systemTeal
   )
    
    let registerButton = UIButton(
     titleColor: UIColor(named: K.BrandColors.blue),
     backgroundColor: UIColor(named: K.BrandColors.lightBlue)
    )
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstrains()
        animationText()
    }

    //MARK: - Set Views
    
    private func setViews() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        
        loginButton.setTitle(K.loginInName, for: .normal)
        registerButton.setTitle(K.registerName, for: .normal)
        
        registerButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func animationText() {
        titleLabel.text = ""
        let titleText = K.appName
        
        for letter in titleText.enumerated() {
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(letter.offset), repeats: false) { _ in
                self.titleLabel.text! += String(letter.element)
            }
        }

    }

    @objc private func buttonTapped(_ sender: UIButton) {
        let nextVC = RegisterViewController()
        
        if sender.currentTitle == K.registerName {
            nextVC.authorizationType = .register
        } else if sender.currentTitle == K.loginInName {
            nextVC.authorizationType = .logIn
        }
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

//MARK: - Setup Constrains

extension WelcomeViewController {
    
    private func setupConstrains() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(K.Size.buttonSize)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        registerButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(K.Size.buttonSize)
            make.bottom.equalTo(loginButton.snp.top).offset(-K.Size.buttoOffset)
        }
    }
}
