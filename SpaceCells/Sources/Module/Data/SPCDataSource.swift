//
//  SPCDataSource.swift
//  SpaceCells
//
//  Created by Mario on 3/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import Foundation

typealias SPCLocalDataSourceGetDataCompletion = (_ data: [SpacePoster]) -> Void

protocol SPCLocalDataSource {
    func getPosters(completion: SPCLocalDataSourceGetDataCompletion)
}

class SPCLocalDataSourceImpl {
}

extension SPCLocalDataSourceImpl: SPCLocalDataSource {
    
    func getPosters(completion: SPCLocalDataSourceGetDataCompletion) {
        
        let posters = [
            SpacePoster(title: "The Grand Tour", subtitle: "Experience the charm of gravity assists", imageName: "grand_tour"),
            SpacePoster(title: "Mars", subtitle: "Multiple tours available", imageName: "mars"),
            SpacePoster(title: "Earth", subtitle: "Your oasis in space", imageName: "earth"),
            SpacePoster(title: "Venus", subtitle: "See you at the Cloud 9 observatory", imageName: "venus"),
            SpacePoster(title: "Ceres", subtitle: "Queen of the asteroid belt", imageName: "ceres"),
            SpacePoster(title: "Jupiter", subtitle: "Experience the mighty auroras", imageName: "jupiter"),
            SpacePoster(title: "Enceladus", subtitle: "Visit beautiful southern", imageName: "enceladus"),
            SpacePoster(title: "Titan", subtitle: "Ride the tides through the throat of Kraken", imageName: "titan"),
            SpacePoster(title: "Europa", subtitle: "Discover life under the ice", imageName: "europa"),
            SpacePoster(title: "51 Pegasi b", subtitle: "Greetings from your first exoplanet", imageName: "51pegasib"),
            SpacePoster(title: "HD 40307g", subtitle: "Experience the gravity of a super Earth", imageName: "grand_tour"),
            SpacePoster(title: "Kepler-16b", subtitle: "Where your shadow always has company", imageName: "kepler16b"),
            SpacePoster(title: "Kepler-186f", subtitle: "Where the grass is always redder on the other side", imageName: "kepler186f"),
            SpacePoster(title: "PSO J318.5-22", subtitle: "Where the nightlife never ends!", imageName: "nightlife")
        ]
        
        completion(posters)
    }
}
