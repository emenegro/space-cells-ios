
import Foundation

protocol CollectionDataSource {
    var numberOfSections: Int { get }
    var numberOfRows: Int { get }
    func viewModelForRowAtIndexPath<T>(indexPath: IndexPath) -> T?
}

protocol CollectionDelegate {
    func rowSelectedAtIndexPath(indexPath: IndexPath)
}

protocol CollectionViewModelConfigurable {
    associatedtype ViewModelType
    func configure(viewModel: ViewModelType?)
}
