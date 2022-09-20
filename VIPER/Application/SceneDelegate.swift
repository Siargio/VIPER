//
//  SceneDelegate.swift
//  VIPER
//
//  Created by Sergio on 15.09.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = WelcomeModuleBilder.build()
        self.window = window
        window.makeKeyAndVisible()
    }
}
