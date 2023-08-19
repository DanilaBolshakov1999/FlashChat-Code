//
//  UIKit + Extention.swift
//  FlashChat-Code
//
//  Created by Danila Bolshakov on 17.08.2023.
//

import UIKit

extension UIView {
    func makeShadow() {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.layer.shadowRadius = 10
    }
}
