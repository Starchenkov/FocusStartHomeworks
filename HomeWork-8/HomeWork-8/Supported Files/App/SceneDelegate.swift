//
//  SceneDelegate.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 08.06.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.windowScene = windowScene
        let controller = CompanyScreenAssembly().build()
        let navigationVC = UINavigationController(rootViewController: controller)
        self.window?.rootViewController = navigationVC
        self.window?.makeKeyAndVisible()
    }
}
