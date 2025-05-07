//
//  AppDelegate.swift
//  TCA
//
//  Created by Việt Anh Trần on 27/4/25.
//

import UIKit
import ComposableArchitecture

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let store = Store(
            initialState: CounterReducer.State(),
            reducer: { CounterReducer() }
        )
        
        let counterVC = CounterViewController(store: store)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = counterVC
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle



}

