
import Foundation

typealias Section = Int

protocol CollectionableViewModelCellConfigurable {
    associatedtype CollectionableViewModelType: CollectionableViewModel
    func configure(viewModel: CollectionableViewModelType?)
}

protocol CollectionableViewModel {
    func onRowSelected()
}

protocol Collectionable {
    associatedtype Item: CollectionableViewModel
    func items() -> [Section: [Item]]?
    func numberOfSections() -> Section
    func numberOfRows(inSection section: Section) -> Int
    func viewModelForRowAtIndexPath<Item>(indexPath: IndexPath) -> Item?
    func rowSelectedAtIndexPath(indexPath: IndexPath)
}

extension Collectionable {
    
    func numberOfSections() -> Section {
        return items()?.count ?? 0
    }
    
    func numberOfRows(inSection section: Section) -> Int {
        return items()?[section]?.count ?? 0
    }
    
    func viewModelForRowAtIndexPath<Item>(indexPath: IndexPath) -> Item? {
        let sectionItems = items()?[indexPath.section]
        return sectionItems?[indexPath.row] as? Item
    }
    
    func rowSelectedAtIndexPath(indexPath: IndexPath) {
        if let viewModel: Item = viewModelForRowAtIndexPath(indexPath: indexPath) {
            viewModel.onRowSelected()
        }
    }
}

class AnyCollectionable<Item>: Collectionable where Item: CollectionableViewModel {
    
    private let _items: (() -> [Section: [Item]]?)
    private let _numberOfSections: (() -> Section)
    private let _numberOfRows: ((_ section: Section) -> Int)
    private let _viewModelForRowAtIndexPath: ((_ indexPath: IndexPath) -> Item?)
    private let _rowSelectedAtIndexPath: ((_ indexPath: IndexPath) -> Void)
    
    init<C: Collectionable>(_ collectionable: C) where C.Item == Item {
        _items = collectionable.items
        _numberOfSections = collectionable.numberOfSections
        _numberOfRows = collectionable.numberOfRows
        _viewModelForRowAtIndexPath = collectionable.viewModelForRowAtIndexPath
        _rowSelectedAtIndexPath = collectionable.rowSelectedAtIndexPath
    }
    
    func items() -> [Section: [Item]]? {
        return _items()
    }
    
    func numberOfSections() -> Section {
        return _numberOfSections()
    }
    
    func numberOfRows(inSection section: Section) -> Int {
        return _numberOfRows(section)
    }
    
    func viewModelForRowAtIndexPath<Item>(indexPath: IndexPath) -> Item? {
        return _viewModelForRowAtIndexPath(indexPath) as? Item
    }
    
    func rowSelectedAtIndexPath(indexPath: IndexPath) {
        _rowSelectedAtIndexPath(indexPath)
    }
}
