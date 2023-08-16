//
//  ViewController.swift
//  FlashChat-Code
//
//  Created by iOS - Developer on 16.08.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: - UI
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: K.BrandColors.blue)
        label.font = .systemFont(ofSize: 50, weight: .black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - UI
    private lazy var registerButton: UIButton = {
        let label = UIButton(type: .system)
        label.titleLabel?.font = .systemFont(ofSize: 30)
        label.setTitle(K.BrandColors.blue, for: .normal)
        label.backgroundColor = UIColor(named: K.BrandColors.lightBlue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let label = UIButton(type: .system)
        label.titleLabel?.font = .systemFont(ofSize: 30)
        label.setTitle(K.BrandColors.blue, for: .normal)
        label.backgroundColor = UIColor(named: K.BrandColors.lightBlue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstrains()
    }

    //MARK: - Set Views
    
    private func setViews() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        
        titleLabel.text = K.appName
        loginButton.setTitle(K.loginInName, for: .normal)
        registerButton.setTitle(K.registerName, for: .normal)
    }

}

//MARK: - Setup Constrains

extension ViewController {
    
    private func setupConstrains() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
