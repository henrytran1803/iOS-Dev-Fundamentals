//
//  MainTabViewController.swift
//  UIView&Controls
//
//  Created by henrytran1803 on 2/19/25.
//

import UIKit
import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        customizeAppearance()
    }
    
    private func setupTabBar() {
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let settingsVC = UINavigationController(rootViewController: SettingViewController())
        let navigationVC = UINavigationController(rootViewController: NavigationViewController())
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape.fill"), tag: 1)
        navigationVC.tabBarItem = UITabBarItem(title: "Nav", image: UIImage(systemName: "circle.fill"), tag: 2)
        viewControllers = [homeVC, settingsVC, navigationVC]
    }

    private func customizeAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground() // Background không trong suốt
        appearance.backgroundColor = .black // Màu nền TabBar
        
        // Màu cho tab được chọn và chưa chọn
        appearance.stackedLayoutAppearance.selected.iconColor = .white
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.stackedLayoutAppearance.normal.iconColor = .gray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
        
        // Áp dụng vào tabBar
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}
