//
//  MainRouter.swift
//  SpaceCells
//
//  Created by Mario on 23/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import UIKit

protocol MainRouter {
    func show(viewController: UIViewController, sender: Any?)
    func present(viewController: UIViewController, animated: Bool, completion:(() -> Void)?)
}

class MainRouterImpl {
    
    let window: UIWindow
    var rootViewController: UIViewController? {
        return window.rootViewController
    }
    
    init(window: UIWindow) {
        self.window = window
    }
}

extension MainRouterImpl: MainRouter {
    
    func show(viewController: UIViewController, sender: Any?) {
        rootViewController?.show(viewController, sender: sender)
    }
    
    func present(viewController: UIViewController, animated: Bool, completion:(() -> Void)?) {
        rootViewController?.present(viewController, animated: animated, completion: completion)
    }
}
