//
//  CollectionProtocols.swift
//  SpaceCells
//
//  Created by Mario on 23/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import Foundation

protocol CollectionDataSource {
    var numberOfSections: Int { get }
    var numberOfRows: Int { get }
    func dataForRowAtIndexPath<T>(indexPath: IndexPath) -> T?
}

protocol CollectionDelegate {
    func rowSelectedAtIndexPath(indexPath: IndexPath)
}
