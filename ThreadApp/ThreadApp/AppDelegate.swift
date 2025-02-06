//
//  AppDelegate.swift
//  ThreadApp
//
//  Created by henrytran1803 on 2/4/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - App Launch
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print(#function)
        return true
    }
    
    // MARK: - App State Changes
    func applicationWillResignActive(_ application: UIApplication) {
        // App sắp mất active state (ví dụ: có cuộc gọi đến)
        print(#function)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // App đã vào background
        print(#function)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // App sắp vào foreground
        print(#function)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // App đã trở thành active
        print(#function)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // App sắp bị terminate
        print(#function)
    }

    // MARK: - Memory Management
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        // Được gọi khi hệ thống thiếu bộ nhớ
        print(#function)
    }

    // MARK: - Background Tasks
    func applicationDidFinishLaunching(_ application: UIApplication) {
        // App đã hoàn thành launching
        print(#function)
    }
    
    // MARK: - Scene Session Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        print(#function)
    }
    
    // MARK: - Remote Notifications
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print(#function)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(#function)
    }
    
    // MARK: - URL Handling
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print(#function)
        return true
    }
    
    // MARK: - Time Changes
    func applicationSignificantTimeChange(_ application: UIApplication) {
        // Được gọi khi có thay đổi thời gian đáng kể
        print(#function)
    }
}

