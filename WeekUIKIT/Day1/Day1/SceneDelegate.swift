//
//  SceneDelegate.swift
//  Day1
//
//  Created by Việt Anh Trần on 31/3/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let winowscene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: winowscene)
        window?.makeKeyAndVisible()
        window?.rootViewController = ViewController()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print("[SceneDelegate] Scene active 🔥")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        print("[SceneDelegate] Scene sắp bị dừng ⏳")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print("[SceneDelegate] Scene vào background 🌑")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        print("[SceneDelegate] Scene vào foreground ☀️")
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print("[SceneDelegate] Scene bị huỷ kết nối ❌")
    }


}

