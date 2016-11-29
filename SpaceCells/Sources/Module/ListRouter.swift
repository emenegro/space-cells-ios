
import UIKit

class ListRouter {
    
    let mainRouter: MainRouter
    
    init(mainRouter: MainRouter) {
        self.mainRouter = mainRouter
    }
    
    func navigateToDetail(title: String, imageName: String) {
        
        let detailViewController = PosterDetailViewController(title: title, imageName: imageName)
        detailViewController.infoWebButtonSelectionBlock = {
            self.mainRouter.openAppIfPossible(intent: "http://www.jpl.nasa.gov/visions-of-the-future/about.php")
        }
        
        mainRouter.show(viewController: detailViewController, sender: self)
    }
    
    func showInfo(title: String, message: String) {
        let infoViewController = PosterInfoViewController(title: title, message: message)
        mainRouter.present(viewController: infoViewController, animated: true, completion: nil)
    }
}

extension ListRouter: ModuleFactory {
    
    static func create(withMainRouter mainRouter: MainRouter) -> UIViewController {
        
        let localDataSource = PostersLocalDataSourceImpl()
        let repository = PostersRepositoryImpl(localDataSource: localDataSource)
        let interactor = GetSpacePostersImpl(repository: repository)
        let router = ListRouter(mainRouter: mainRouter)
        let presenter = ListPresenterImpl(interactor: interactor, router: router)
        let tableViewCollectionable = AnyCollectionable(presenter)
        let view = ListViewController(presenter: presenter, tableViewCollectionable: tableViewCollectionable)
        
        repository.output = interactor
        interactor.output = presenter
        presenter.view = view
        
        return view
    }
}
