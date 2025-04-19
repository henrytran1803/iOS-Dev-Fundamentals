//
//  AppDelegate.swift
//  HomeWork_Buoi10_TranVietAnh
//
//  Created by Việt Anh Trần on 19/4/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        let window = UIWindow()
        self.window = window
        let homeVC = WelcomeViewController()
        let nav = UINavigationController(rootViewController: homeVC)
        nav.isNavigationBarHidden = true
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        return true
    }



}

