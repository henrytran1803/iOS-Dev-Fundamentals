//
//  AppDelegate.swift
//  UIViewApp
//
//  Created by Việt Anh Trần on 18/4/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow()
        let homeVC = NewViewController()
        self.window?.rootViewController = homeVC
        self.window?.makeKeyAndVisible()
        return true
    }

}

