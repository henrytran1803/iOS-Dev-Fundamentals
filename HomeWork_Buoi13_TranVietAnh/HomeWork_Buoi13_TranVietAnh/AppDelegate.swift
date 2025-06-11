//
//  AppDelegate.swift
//  HomeWork_Buoi13_TranVietAnh
//
//  Created by Việt Anh Trần on 11/6/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        
        let homeVC = HomeViewController()
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeVC.tabBarItem = UITabBarItem(title: "Cat", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let secondVC = SecondViewController()
        let secondNav = UINavigationController(rootViewController: secondVC)
        secondVC.tabBarItem = UITabBarItem(title: "Dogs", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))

        let thirdVC = ThirdViewController()
        let thirdNav = UINavigationController(rootViewController: thirdVC)
        thirdVC.tabBarItem = UITabBarItem(title: "Holidays", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))

        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [homeNav, secondNav, thirdNav]
                
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()

        return true
    }

}

