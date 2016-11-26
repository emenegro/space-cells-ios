//
//  VisualConstants.swift
//  SpaceCells
//
//  Created by Mario on 23/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import UIKit

struct AppColors {
    static let background = UIColor(red:0.22, green:0.22, blue:0.22, alpha:1.00)
    static let backgroundSecondary = UIColor(red:0.32, green:0.32, blue:0.32, alpha:1.00)
    static let foreground = UIColor.white
    static let tint = UIColor(red:0.54, green:0.67, blue:0.70, alpha:1.00)
}

class AppAppearance {
    
    static func apply(_ window: UIWindow) {
        AppAppearance.applyWindowStyle(window)
        AppAppearance.applyNavigationBarStyle()
    }
}

private extension AppAppearance {

    static func applyWindowStyle(_ window: UIWindow) {
        window.backgroundColor = AppColors.background
        window.tintColor = AppColors.tint
    }
    
    static func applyNavigationBarStyle() {
        let appearance = UINavigationBar.appearance()
        appearance.tintColor = AppColors.tint
        appearance.barTintColor = AppColors.background
        appearance.isTranslucent = false
        appearance.titleTextAttributes = [NSForegroundColorAttributeName : AppColors.foreground]
    }
}
