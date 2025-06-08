//
//  AppDelegate.swift
//  Networking
//
//  Created by Việt Anh Trần on 7/6/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow()
        let mainVC = MainViewController()
        let nav = UINavigationController(rootViewController: mainVC)
        
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }


}

