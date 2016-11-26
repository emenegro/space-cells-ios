
import UIKit

protocol MainRouter {
    func show(viewController: UIViewController, sender: Any?)
    func present(viewController: UIViewController, animated: Bool, completion:(() -> Void)?)
    func openAppIfPossible(intent: String)
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
    
    func openAppIfPossible(intent: String) {
        
        guard let url = URL(string: intent) else {
            return
        }
        
        guard UIApplication.shared.canOpenURL(url) else {
            return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
