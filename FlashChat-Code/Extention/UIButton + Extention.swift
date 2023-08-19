//
//  UIButton + Extention.swift
//  FlashChat-Code
//
//  Created by iOS - Developer on 18.08.2023.
//

import UIKit

extension UIButton {
    convenience init(titleColor: UIColor?, backgroundColor: UIColor? = .clear) {
        self.init(type: .system)
        self.titleLabel?.font = .systemFont(ofSize: 30)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 20
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
