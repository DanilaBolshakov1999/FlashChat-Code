//
//  SceneDelegate.swift
//  FlashChat-Code
//
//  Created by iOS - Developer on 16.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let welcomeVC = ViewController()
        window?.rootViewController = UINavigationController(rootViewController: welcomeVC)
        window?.makeKeyAndVisible()
    }
}

