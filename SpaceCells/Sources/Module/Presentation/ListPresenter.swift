
import UIKit

protocol ListPresenter {
    var title: String { get }
    func viewWillAppear()
}

class ListPresenterImpl {
    
    let interactor: GetSpacePosters
    let router: ListRouter
    weak var view: ListView?
    var posters: [Poster] = []
    var viewModels: [PosterCellViewModel] = []
    
    init(interactor: GetSpacePosters, router: ListRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    fileprivate func populateViewModels() {
        
        var viewModels: [PosterCellViewModel] = []
        
        for poster in posters {
            
            let viewModel = PosterCellViewModel(
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

extension ListPresenterImpl: ListPresenter {
    
    var title: String {
        return NSLocalizedString("txt_app_name", comment: "")
    }
    
    func viewWillAppear() {
        interactor.getPosters()
    }
}

extension ListPresenterImpl: CollectionDataSource {
    
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

extension ListPresenterImpl: CollectionDelegate {
    
    func rowSelectedAtIndexPath(indexPath: IndexPath) {
        let poster = posters[indexPath.row]
        router.navigateToDetail(title: poster.title, imageName: poster.imageName)
    }
}

extension ListPresenterImpl: GetSpacePostersOutput {
    
    func onPosters(posters: [Poster]) {
        self.posters = posters
        populateViewModels()
        view?.reloadData()
    }
}
