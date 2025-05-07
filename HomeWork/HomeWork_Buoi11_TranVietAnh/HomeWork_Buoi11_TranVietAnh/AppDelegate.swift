//
//  AppDelegate.swift
//  HomeWork_Buoi11_TranVietAnh
//
//  Created by Việt Anh Trần on 23/4/25.
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

    // MARK: UISceneSession Lifecycle

}

