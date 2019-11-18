//
//  AppDelegate.swift
//  AcuDragon
//
//  Created by Emiko Clark on 1/22/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit
//import Google

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let MY_CLIENT_ID = "844411766152-cjl9ofh6au9ntejf4fam6dhod4fnisg5.apps.googleusercontent.com"

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
