
import Foundation

protocol CollectionableViewModelCellConfigurable {
    associatedtype CollectionableViewModelType: CollectionableViewModel
    func configure(viewModel: CollectionableViewModelType?)
}

protocol CollectionableViewModel {
    func onRowSelected()
}

protocol Collectionable {
    associatedtype Item: CollectionableViewModel
    func items() -> [Int: [Item]]
    func numberOfSections() -> Int
    func numberOfRows(inSection section: Int) -> Int
    func viewModelForRowAtIndexPath<Item>(indexPath: IndexPath) -> Item?
    func rowSelectedAtIndexPath(indexPath: IndexPath)
}

extension Collectionable {
    
    func numberOfSections() -> Int {
        return items().count
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return items()[section]?.count ?? 0
    }
    
    func viewModelForRowAtIndexPath<Item>(indexPath: IndexPath) -> Item? {
        let sectionItems = items()[indexPath.section]
        return sectionItems?[indexPath.row] as? Item
    }
    
    func rowSelectedAtIndexPath(indexPath: IndexPath) {
        if let viewModel: Item = viewModelForRowAtIndexPath(indexPath: indexPath) {
            viewModel.onRowSelected()
        }
    }
}

class AnyCollectionable<Item>: Collectionable where Item: CollectionableViewModel {
    
    private let _items: (() -> [Int: [Item]])
    private let _numberOfSections: (() -> Int)
    private let _numberOfRows: ((_ section: Int) -> Int)
    private let _viewModelForRowAtIndexPath: ((_ indexPath: IndexPath) -> Item?)
    private let _rowSelectedAtIndexPath: ((_ indexPath: IndexPath) -> Void)
    
    init<C: Collectionable>(_ collectionable: C) where C.Item == Item {
        _items = collectionable.items
        _numberOfSections = collectionable.numberOfSections
        _numberOfRows = collectionable.numberOfRows
        _viewModelForRowAtIndexPath = collectionable.viewModelForRowAtIndexPath
        _rowSelectedAtIndexPath = collectionable.rowSelectedAtIndexPath
    }
    
    func items() -> [Int: [Item]] {
        return _items()
    }
    
    func numberOfSections() -> Int {
        return _numberOfSections()
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return _numberOfRows(section)
    }
    
    func viewModelForRowAtIndexPath<Item>(indexPath: IndexPath) -> Item? {
        return _viewModelForRowAtIndexPath(indexPath) as? Item
    }
    
    func rowSelectedAtIndexPath(indexPath: IndexPath) {
        _rowSelectedAtIndexPath(indexPath)
    }
}
