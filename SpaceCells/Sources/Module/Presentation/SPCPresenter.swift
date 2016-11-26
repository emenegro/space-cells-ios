
import UIKit

protocol SPCPresenter {
    var title: String { get }
    func viewWillAppear()
}

class SPCPresenterImpl {
    
    let interactor: GetSpacePosters
    let router: SPCRouter
    weak var view: SPCView?
    var posters: [SPCPoster] = []
    var viewModels: [SPCPosterCellViewModel] = []
    
    init(interactor: GetSpacePosters, router: SPCRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    fileprivate func populateViewModels() {
        
        var viewModels: [SPCPosterCellViewModel] = []
        
        for poster in posters {
            
            let viewModel = SPCPosterCellViewModel(
                title: poster.title,
                subtitle: poster.subtitle,
                imageName: poster.imageName,
                infoButtonSelectionBlock: { [weak self] in
                    self?.router.showInfo(title: poster.title, message: poster.description)
                }
            )
            
            viewModels.append(viewModel)
        }
        
        self.viewModels = viewModels
    }
}

extension SPCPresenterImpl: SPCPresenter {
    
    var title: String {
        return NSLocalizedString("txt_app_name", comment: "")
    }
    
    func viewWillAppear() {
        interactor.getPosters()
    }
}

extension SPCPresenterImpl: CollectionDataSource {
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfRows: Int {
        return viewModels.count
    }
    
    func viewModelForRowAtIndexPath<T>(indexPath: IndexPath) -> T? {
        return viewModels[indexPath.row] as? T
    }
}

extension SPCPresenterImpl: CollectionDelegate {
    
    func rowSelectedAtIndexPath(indexPath: IndexPath) {
        let poster = posters[indexPath.row]
        router.navigateToDetail(title: poster.title, imageName: poster.imageName)
    }
}

extension SPCPresenterImpl: GetSpacePostersOutput {
    
    func onPosters(posters: [SPCPoster]) {
        self.posters = posters
        populateViewModels()
        view?.reloadData()
    }
}
