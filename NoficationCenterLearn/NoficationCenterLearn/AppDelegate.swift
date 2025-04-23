//
//  AppDelegate.swift
//  NoficationCenterLearn
//
//  Created by Việt Anh Trần on 19/4/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow()
        let mainVC = MainViewController()
        let nav = UINavigationController(rootViewController: mainVC)
//        nav.isNavig ationBarHidden = true
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }


}

