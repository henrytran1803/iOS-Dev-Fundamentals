//
//  AppDelegate.swift
//  HomeWork_buoi10_TranVietAnh
//
//  Created by Việt Anh Trần on 21/4/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        self.window = window
        let loginVC = LoginViewController()
        let nav = UINavigationController(rootViewController: loginVC)
        nav.isNavigationBarHidden = true
        window.rootViewController = nav
        window.makeKeyAndVisible()
        return true
    }



}

