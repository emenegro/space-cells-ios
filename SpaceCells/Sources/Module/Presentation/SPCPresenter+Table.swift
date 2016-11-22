//
//  SPCTableViewProtocols.swift
//  SpaceCells
//
//  Created by Mario on 22/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import Foundation

protocol SPCCollectionDataSource {
    var numberOfSections: Int { get }
    var numberOfRows: Int { get }
    func dataForRowAtIndexPath(indexPath: IndexPath) -> SPCCellViewModel?
}

protocol SPCCollectionDelegate {
    func rowSelectedAtIndexPath(indexPath: IndexPath)
}

extension SPCPresenterImpl: SPCCollectionDataSource {
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfRows: Int {
        return data.count
    }
    
    func dataForRowAtIndexPath(indexPath: IndexPath) -> SPCCellViewModel? {
        return data[indexPath.row]
    }
}

extension SPCPresenterImpl: SPCCollectionDelegate {
    
    func rowSelectedAtIndexPath(indexPath: IndexPath) {
        router.navigateToDetail(viewModel: data[indexPath.row])
    }
}
