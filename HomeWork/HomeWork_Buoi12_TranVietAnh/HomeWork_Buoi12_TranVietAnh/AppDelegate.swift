//
//  AppDelegate.swift
//  HomeWork_Buoi12_TranVietAnh
//
//  Created by Việt Anh Trần on 7/5/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow()
        let homeVC = HomeViewController()
        self.window?.rootViewController = homeVC
        self.window?.makeKeyAndVisible()
    
        
        return true
    }


}

