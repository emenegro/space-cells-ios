//
//  SPCPresenter+Table.swift
//  SpaceCells
//
//  Created by Mario on 22/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import Foundation

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
