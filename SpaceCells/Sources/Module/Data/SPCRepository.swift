//
//  SPCRepository.swift
//  SpaceCells
//
//  Created by Mario on 3/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import Foundation

protocol SPCRepository {
    func getPosters()
}

protocol SPCRepositoryOutput: class {
    func onPosters(posters: [SpacePoster])
}

class SPCRepositoryImpl {

    let localDataSource: SPCLocalDataSource
    weak var output: SPCRepositoryOutput?
    
    init(localDataSource: SPCLocalDataSource) {
        self.localDataSource = localDataSource
    }
}

extension SPCRepositoryImpl: SPCRepository {
    
    func getPosters() {
        localDataSource.getPosters { [weak self] posters in
            self?.output?.onPosters(posters: posters)
        }
    }
}
