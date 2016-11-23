//
//  AppDelegate.swift
//  SpaceCells
//
//  Created by Mario on 22/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        let mainRouter = MainRouterImpl(window: window)
        let rootViewController = SPCRouter.create(mainRouter: mainRouter)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        window.rootViewController = navigationController
        window.backgroundColor = AppColors.background
        window.tintColor = AppColors.foreground
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }
}
