//
//  AppDelegate.swift
//  Day1
//
//  Created by Việt Anh Trần on 31/3/25.
//
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("[AppDelegate] App đã khởi động 🚀")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("[AppDelegate] App sẽ vào background ⏳")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("[AppDelegate] App đã vào background 🌑")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("[AppDelegate] App sẽ vào foreground ☀️")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("[AppDelegate] App đã active 🔥")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("[AppDelegate] App sẽ bị terminate ❌")
    }
}

