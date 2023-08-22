//
//  ChatViewController.swift
//  FlashChat-Code
//
//  Created by iOS - Developer on 18.08.2023.
//

import UIKit

final class ChatViewController: UIViewController {
    
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
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Private Properties
    
    var messages = Message.getMassage()
    
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
        tableView.register(MessageCell.self , forCellReuseIdentifier: K.cellIdentifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
        view.addSubview(containerView)
        containerView.addSubview(messageTextField)
        containerView.addSubview(enterButton)
        
        enterButton.addTarget(self, action: #selector(tapEnterButton), for: .touchUpInside)
    }
    
    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //MARK: - Actions
    
    @objc private func tapEnterButton() {
        if let text = messageTextField.text, !text.isEmpty {
            messages.append(Message(sender: .me, body: text))
            messageTextField.text = ""
            tableView.reloadData()
            let indexPath = IndexPath(row: messages.count - 1, section: 0)
            tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}

//MARK: - UITableViewDataSource UITableViewDelegate

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as? MessageCell else { fatalError() }
        let model = messages[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}

//MARK: - Setup Constrains

extension ChatViewController {
    
    private func setupConstrains() {
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        containerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(60)
            make.top.equalTo(tableView.snp.bottom)
           
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
