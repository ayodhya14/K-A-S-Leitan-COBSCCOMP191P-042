//
//  AppDelegate.swift
//  K A S Leitan-COBSCCOMP191P-042
//
//  Created by Prasad Gunasekara on 9/14/20.
//  Copyright © 2020 Ayodhya Leitan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
//    var window: UIWindow?
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        //Create a window that is the same size as the screen
//        window = UIWindow()
//
//        window?.rootViewController = ViewController()
//        // Show the window
//        window?.makeKeyAndVisible()
//
//        return true


}

