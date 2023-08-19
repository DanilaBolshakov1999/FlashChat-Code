//
//  Message.swift
//  FlashChat-Code
//
//  Created by iOS - Developer on 19.08.2023.
//

import Foundation

struct Message {
    enum Sender {
        case me, you
    }
    
    let sender: Sender
    let body: String
}
 
extension Message {
    static func getMassage() -> [Message] {
        return [
            Message(sender: .you , body: "What is the capital of France?"),
            Message(sender: .you , body: "What is the capital of France?"),
            Message(sender: .you , body: "What is the capital of France?"),
            Message(sender: .you , body: "What is the capital of France?"),
            Message(sender: .you , body: "What is the capital of France?"),
            Message(sender: .you , body: "What is the capital of France?"),
            Message(sender: .you , body: "What is the capital of France?"),
            Message(sender: .you , body: "What is the capital of France?"),
            Message(sender: .you , body: "What is the capital of France?")
        ]
    }
}
