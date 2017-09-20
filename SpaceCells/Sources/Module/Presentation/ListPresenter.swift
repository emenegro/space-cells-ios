
import Foundation

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

            let selectionBlock: () -> Void = { [weak self] in
                self?.router.navigateToDetail(title: poster.title, imageName: poster.imageName)
            }

            let infoButtonSelectionBlock: () -> Void = { [weak self] in
                self?.router.showInfo(title: poster.title, message: poster.description)
            }

            let viewModel = PosterCellViewModel(
                title: poster.title,
                subtitle: poster.subtitle,
                imageName: poster.imageName,
                selectionBlock: selectionBlock,
                infoButtonSelectionBlock: infoButtonSelectionBlock
            )
            
            viewModels.append(viewModel)
        }
        
        self.viewModels = viewModels
    }
}

extension ListPresenterImpl: ListPresenter {
    
    var title: String {
        return L10n.appName.localized
    }
    
    func viewWillAppear() {
        interactor.getPosters()
    }
}

extension ListPresenterImpl: GetSpacePostersOutput {
    
    func onPosters(posters: [Poster]) {
        self.posters = posters
        populateViewModels()
        view?.reloadData()
    }
}

extension ListPresenterImpl: Collectionable {
    
    func items() -> [Section : [PosterCellViewModel]]? {
        return [0: viewModels]
    }
}
