//
//  AppDelegate.swift
//  Bankey
//
//  Created by Micaella Morales on 3/23/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
//        window?.rootViewController = LoginViewController()
//        window?.rootViewController = OnboardingViewController()
        window?.rootViewController = OnboardingContentViewController()
        
        return true
    }

}

