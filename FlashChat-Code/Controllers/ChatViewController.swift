//
//  ChatViewController.swift
//  FlashChat-Code
//
//  Created by iOS - Developer on 17.08.2023.
//

import UIKit
import SnapKit

class ChatViewController: UIViewController {
    
    //MARK: - UI
    
    private let tableView = UITableView()
    
    private lazy var containerView: UIView = {
        let element = UIView()
        element.backgroundColor = .yellow
        return element
    }()
    
    private lazy var messegeTextField: UITextField = {
        let element = UITextField()
        return element
    }()
    
    private lazy var enterButton: UIButton = {
        let label = UIButton(type: .system)
        label.setTitle("", for: .normal)
        return label
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setViews()
        setupConstrains()
    }
    
    //MARK: - Set Views
    
    private func setViews() {
        view.backgroundColor = UIColor(named: K.BrandColors.purple)
        title = K.appName
        
        tableView.register(UITableView.self, forCellReuseIdentifier: K.cellIdentifier)
        view.addSubview(tableView)
    }
    
    private func setDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}
//MARK: - UITableViewDataSource UITableViewDelegate

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        cell.textLabel?.text = "Cell number: \(indexPath.row)"
        return cell
    }
}

//MARK: - Setup Constrains

extension ChatViewController {
    private func setupConstrains() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)

        }
    }
}
