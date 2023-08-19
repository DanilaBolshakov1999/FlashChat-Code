//
//  UITextField + Extention.swift
//  FlashChat-Code
//
//  Created by iOS - Developer on 18.08.2023.
//

import UIKit

extension UITextField {
    convenience init(placeholder: String, color: UIColor?) {
        self.init()
        self.placeholder = placeholder
        self.textAlignment = .center
        self.backgroundColor = .white
        self.layer.cornerRadius = 30
        self.font = .systemFont(ofSize: 25)
        self.textColor = color
        self.tintColor = color
    }
}
