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
    var data: [SPCCellViewModel] = []
    
    init(interactor: GetSpacePosters, router: SPCRouter) {
        self.interactor = interactor
        self.router = router
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
    
    func onPosters(posters: [SpacePoster]) {
        
        var data: [SPCCellViewModel] = []
        
        for (index, poster) in posters.enumerated() {
            
            let selectionBlock: SPCCellViewModelInfoSelectionBlock = { [weak self] index in
                if let viewModel = self?.data[index] {
                    self?.router.showInfo(viewModel: viewModel)
                }
            }
        
            let viewModel = SPCCellViewModel(
                index: index,
                text: poster.title,
                secondaryText: poster.subtitle,
                imageName: poster.imageName,
                infoButtonSelectionBlock: selectionBlock
            )
            
            data.append(viewModel)
        }
        
        self.data = data
        view?.reloadData()
    }
}
