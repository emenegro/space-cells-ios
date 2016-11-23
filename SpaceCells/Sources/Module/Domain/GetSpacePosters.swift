//
//  GetSpacePosters.swift
//  SpaceCells
//
//  Created by Mario on 3/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import Foundation

protocol GetSpacePosters {
    func getPosters()
}

protocol GetSpacePostersOutput: class {
    func onPosters(posters: [SPCPoster])
}

class GetSpacePostersImpl {
    
    let repository: SPCRepository
    weak var output: GetSpacePostersOutput?
    
    init(repository: SPCRepository) {
        self.repository = repository
    }
}

extension GetSpacePostersImpl: GetSpacePosters {
    
    func getPosters() {
        repository.getPosters()
    }
}

extension GetSpacePostersImpl: SPCRepositoryOutput {
    
    func onPosters(posters: [SPCPoster]) {
        output?.onPosters(posters: posters)
    }
}
