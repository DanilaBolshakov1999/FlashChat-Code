//
//  ChatViewController.swift
//  FlashChat-Code
//
//  Created by iOS - Developer on 18.08.2023.
//

import UIKit

class ChatViewController: UIViewController {
    
    //MARK: - UI
    
    private let tableView = UITableView()
    
    private lazy var containerView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: K.BrandColors.purple)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var messageTextField: UITextField = {
        let label = UITextField()
        label.backgroundColor = .white
        label.borderStyle = .roundedRect
        label.placeholder = K.enterMessagePlaceholder
        label.textColor = UIColor(named: K.BrandColors.purple)
        label.tintColor = UIColor(named: K.BrandColors.purple)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var enterButton: UIButton = {
        let label = UIButton(type: .system)
        label.setImage(UIImage(systemName: K.enterButtonImageName), for: .normal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelTableView: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Private Properties
    
    let messages = Message.getMassage()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setViews()
        setupConstrains()
    }
    
    //MARK: - Set Views
    private func setViews() {
        view.backgroundColor = UIColor(named: K.BrandColors.purple)
        title = K.appName
        navigationController?.navigationBar.barTintColor = UIColor(named: K.BrandColors.blue)
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self , forCellReuseIdentifier: K.cellIdentifier)
        view.addSubview(tableView)
        view.addSubview(containerView)
        containerView.addSubview(messageTextField)
        containerView.addSubview(enterButton)
    }
    
    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

//MARK: - UITableViewDataSource UITableViewDelegate

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
    
        var content = cell.defaultContentConfiguration()
        let model = messages[indexPath.row]
        content.text = model.body

        cell.contentConfiguration = content
        
        return cell
    }
}

//MARK: - Setup Constrains

extension ChatViewController {
    
    private func setupConstrains() {
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            //make.bottom.equalTo(containerView.snp.top)
        }
        
        containerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(60)
            make.bottom.equalTo(tableView.snp.bottom)
        }
        
        messageTextField.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(20)
        }
        
        enterButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(20)
            make.leading.equalTo(messageTextField.snp.trailing).offset(20)
            make.height.width.equalTo(40)
        }
    }
}
