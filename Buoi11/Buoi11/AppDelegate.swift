//
//  AppDelegate.swift
//  Buoi11
//
//  Created by Việt Anh Trần on 22/4/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
        let homeVC = HomeViewController()
        let nav = UINavigationController(rootViewController: homeVC)
        nav.isNavigationBarHidden = true
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }

    

}

