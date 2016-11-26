
import UIKit

protocol ModuleFactory {
    static func create(withMainRouter mainRouter: MainRouter) -> UIViewController
}
