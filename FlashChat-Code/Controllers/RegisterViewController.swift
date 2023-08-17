//
//  RegisterViewController.swift
//  FlashChat-Code
//
//  Created by iOS - Developer on 16.08.2023.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    
    enum AuthorizationType: String {
        case register = "Register"
        case logIn = "Login In"
    }
    
    //MARK: - UI
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 8
        return element
    }()
   
    private let emailTextFiled = UITextField(
        placeholder: K.email,
        color: UIColor(named: K.BrandColors.blue)!
    )
    
    private let passwordTextFiled = UITextField(
        placeholder: K.passwordName,
        color: .black
    )
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: K.textfieldImageName)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let registerButton = UIButton(titleColor: UIColor(named: K.BrandColors.blue))
    
    //MARK: - Public Property
    
    public var authorizationType: AuthorizationType?
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstrains()
    }

    //MARK: - Set Views
    
    private func setViews() {
        
        switch authorizationType {
        case .register:
            view.backgroundColor = UIColor(named: K.BrandColors.lightBlue)
            registerButton.setTitle(K.registerName, for: .normal)
        case .logIn:
            view.backgroundColor = UIColor(named: K.BrandColors.blue)
            registerButton.setTitle(K.loginInName, for: .normal)
            registerButton.setTitleColor(.white, for: .normal)
            
            emailTextFiled.text = "Danila1999777@gmai.com"
        default:
            break
        }
        
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(emailTextFiled)
        mainStackView.addArrangedSubview(imageView)
        imageView.addSubview(passwordTextFiled)
        mainStackView.addArrangedSubview(registerButton)
        
        emailTextFiled.makeShadow()
        registerButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc private func buttonTapped(_ sender: UIButton) {
        if sender.currentTitle == K.loginInName {
            let chatVC = ChatViewController()
            navigationController?.pushViewController(chatVC, animated: true)
        } else if sender.currentTitle == K.registerName {
            print("registerName")
        }
    }
}

//MARK: - Setup Constrains

extension RegisterViewController {
    
    private func setupConstrains() {
        mainStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        emailTextFiled.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.leading.trailing.equalTo(view).inset(36)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(137)
            make.leading.trailing.equalTo(view)
        }
        
        passwordTextFiled.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.bottom.equalToSuperview().offset(-62)
            make.leading.trailing.equalToSuperview().inset(48)
            make.height.equalTo(45)
        }
    }
}
