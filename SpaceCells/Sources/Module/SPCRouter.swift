//
//  SPCRouter.swift
//  SpaceCells
//
//  Created by Mario on 3/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import UIKit

class SPCRouter {
    
    let mainRouter: MainRouter
    
    init(mainRouter: MainRouter) {
        self.mainRouter = mainRouter
    }
    
    func navigateToDetail(title: String, imageName: String) {
        let detailViewController = SPCPosterDetailViewController(title: title, imageName: imageName)
        mainRouter.show(viewController: detailViewController, sender: self)
    }
    
    func showInfo(title: String, message: String) {
        let infoViewController = SPCPosterInfoViewController(title: title, message: message)
        mainRouter.present(viewController: infoViewController, animated: true, completion: nil)
    }
}

extension SPCRouter: ModuleFactory {
    
    static func create(mainRouter: MainRouter) -> UIViewController {
        
        let localDataSource = SPCLocalDataSourceImpl()
        let repository = SPCRepositoryImpl(localDataSource: localDataSource)
        let interactor = GetSpacePostersImpl(repository: repository)
        let router = SPCRouter(mainRouter: mainRouter)
        let presenter = SPCPresenterImpl(interactor: interactor, router: router)
        let view = SPCViewController(presenter: presenter, tableViewDataSource: presenter, tableViewDelegate: presenter)
        
        repository.output = interactor
        interactor.output = presenter
        presenter.view = view
        
        return view
    }
}
