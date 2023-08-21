//
//  Messege Call.swift
//  FlashChat-Code
//
//  Created by iOS - Developer on 19.08.2023.
//

import UIKit

class MessageCell: UITableViewCell {
    
    //MARK: - Element
    
    private lazy var mainStackViews: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var leftImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: K.youAvatar)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    private lazy var rightImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: K.meAvatar)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var messageView: UIView = {
        let label = UIView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Life Cycle
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public Properties
    
    public func configure(model: Message) {
        messageLabel.text = model.body
    }
    
    //MARK: - Set Views
    private func setViews() {
        addSubview(mainStackViews)
        mainStackViews.addArrangedSubview(leftImageView)
        mainStackViews.addArrangedSubview(messageView)
        mainStackViews.addArrangedSubview(rightImageView)
        messageView.addSubview(messageLabel)
    }
}

//MARK: - Setup Constrains

extension MessageCell {
    private func setupConstrains() {
        mainStackViews.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        leftImageView.snp.makeConstraints { make in
            make.height.width.equalTo(40)
        }
        
        rightImageView.snp.makeConstraints { make in
            make.height.width.equalTo(40)
        }
    }
}
