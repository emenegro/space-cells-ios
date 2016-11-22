//
//  SPCRouter.swift
//  SpaceCells
//
//  Created by Mario on 3/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import UIKit

class SPCRouter {
    
    func navigateToDetail(viewModel: SPCCellViewModel) {
        print("Navigating to detail of index \(viewModel.index)")
    }
    
    func showInfo(viewModel: SPCCellViewModel) {
        let infoString = NSLocalizedString("txt_info", comment: "")
        let acceptString = NSLocalizedString("txt_accept", comment: "")
        let alertController = UIAlertController(title: infoString, message: viewModel.secondaryText, preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: acceptString, style: .cancel, handler: { [weak alertController] (action) -> Void in
            alertController?.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(acceptAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}

extension SPCRouter: ModuleFactory {
    
    static func create() -> UIViewController {
        
        let localDataSource = SPCLocalDataSourceImpl()
        let repository = SPCRepositoryImpl(localDataSource: localDataSource)
        let interactor = GetSpacePostersImpl(repository: repository)
        let router = SPCRouter()
        let presenter = SPCPresenterImpl(interactor: interactor, router: router)
        let view = SPCViewController(presenter: presenter, tableViewDataSource: presenter, tableViewDelegate: presenter)
        
        repository.output = interactor
        interactor.output = presenter
        presenter.view = view
        
        return view
    }
}
