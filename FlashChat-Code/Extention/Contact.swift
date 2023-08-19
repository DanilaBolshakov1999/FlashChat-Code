//
//  Contacts.swift
//  FlashChat-Code
//
//  Created by iOS - Developer on 16.08.2023.
//

import UIKit

struct K {
    static let appName = "⚡️FlashChat"
    static let logInName = "Log In"
    static let registerName = "Register"
    static let emailName = "Email"
    static let passwordName = "Password"
    
    static let enterButtonImageName = "paperplane.fill"
    static let enterMessagePlaceholder = "Write a message..."
    
    static let meAvatar = "MeAvatar"
    static let youAvatar = "YouAvatar"
    
    static let cellIdentifier = "MessageCell"
    
    static let textfieldImageName = "textfield"
    
    struct BrandColors {
        static let purple = "brandPurple"
        static let lightPurple = "brandLightPurple"
        static let blue = "brandBlue"
        static let lightBlue = "brandLightBlue"
    }
    
    struct Size {
        static let buttonSize: CGFloat = 48
        static let buttonOffset: CGFloat = 8
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
