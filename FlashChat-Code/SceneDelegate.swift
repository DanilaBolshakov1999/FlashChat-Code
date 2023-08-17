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
            
            // Проверка, является ли scene экземпляром UIWindowScene, и приведение типа, если это так:
            guard let windowScene = (scene as? UIWindowScene) else { return }
            
            // Создание экземпляра UIWindow с использованием переданной windowScene:
            window = UIWindow(windowScene: windowScene)
            
            // Создание экземпляра WelcomeViewController, который, представляет наш экран приветствия :
            let welcomeVC = WelcomeViewController()
            
            // Создание экземпляра UINavigationController с welcomeVC в качестве корневого контроллера:
            window?.rootViewController = UINavigationController(rootViewController: welcomeVC)
            
            // Делаем окно видимым:
            window?.makeKeyAndVisible()
        }
}

