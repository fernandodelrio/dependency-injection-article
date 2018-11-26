//
//  AppDelegate.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Swinjector.register()
        
        window = UIWindow()
        window?.rootViewController =
            Swinjector.defaultContainer.resolve(ContactViewable.self) as? UIViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

