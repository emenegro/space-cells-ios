
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        let mainRouter = MainRouterImpl(window: window)
        let rootViewController = ListRouter.create(withMainRouter: mainRouter)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationItem.largeTitleDisplayMode = .always

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        self.window = window

        AppAppearance.apply(window)
        
        return true
    }
}
