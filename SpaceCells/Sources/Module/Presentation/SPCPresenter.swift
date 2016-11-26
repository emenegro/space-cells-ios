//
//  SPCPresenter.swift
//  SpaceCells
//
//  Created by Mario on 3/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import UIKit

protocol SPCPresenter {
    var title: String { get }
    func viewWillAppear()
}

class SPCPresenterImpl {
    
    let interactor: GetSpacePosters
    let router: SPCRouter
    weak var view: SPCView?
    var posters: [SPCPoster] = []
    var viewModels: [SPCPosterCellViewModel] = []
    
    init(interactor: GetSpacePosters, router: SPCRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    fileprivate func populateViewModels() {
        
        var viewModels: [SPCPosterCellViewModel] = []
        
        for poster in posters {
            
            let viewModel = SPCPosterCellViewModel(
                title: poster.title,
                subtitle: poster.subtitle,
                imageName: poster.imageName,
                infoButtonSelectionBlock: { [weak self] in
                    self?.router.showInfo(title: poster.title, message: poster.description)
                }
            )
            
            viewModels.append(viewModel)
        }
        
        self.viewModels = viewModels
    }
}

extension SPCPresenterImpl: SPCPresenter {
    
    var title: String {
        return NSLocalizedString("txt_app_name", comment: "")
    }
    
    func viewWillAppear() {
        interactor.getPosters()
    }
}

extension SPCPresenterImpl: GetSpacePostersOutput {
    
    func onPosters(posters: [SPCPoster]) {
        self.posters = posters
        populateViewModels()
        view?.reloadData()
    }
}
