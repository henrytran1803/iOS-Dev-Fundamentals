//
//  AppDelegate.swift
//  CustomView
//
//  Created by Việt Anh Trần on 6/5/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow()
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: MainTabType.home.rawValue, image: MainTabType.home.icon(isSelected: false), selectedImage: MainTabType.home.icon(isSelected: true))
        let favoriteVC = FavoriteViewController()
        favoriteVC.tabBarItem = UITabBarItem(title: MainTabType.favorite.rawValue, image: MainTabType.favorite.icon(isSelected: false), selectedImage: MainTabType.favorite.icon(isSelected: true))
        let cartVC = CartViewController()
        cartVC.tabBarItem = UITabBarItem(title: MainTabType.cart.rawValue, image: MainTabType.cart.icon(isSelected: false), selectedImage: MainTabType.cart.icon(isSelected: true))
        cartVC.tabBarItem.badgeValue = "1"
        cartVC.tabBarItem.badgeColor = .red
        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(title: MainTabType.profile.rawValue, image: MainTabType.profile.icon(isSelected: false), selectedImage: MainTabType.profile.icon(isSelected: true))
        let tabVC = UITabBarController()
        tabVC.viewControllers = [homeVC, favoriteVC, cartVC, profileVC]
        tabVC.tabBar.backgroundColor = .white
        tabVC.tabBar.tintColor = .brown
        tabVC.tabBar.unselectedItemTintColor = .lightGray
        window?.rootViewController = tabVC
        window?.makeKeyAndVisible()
        
        
        return true
    }



}

