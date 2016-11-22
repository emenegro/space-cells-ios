//
//  SPCView+Table.swift
//  SpaceCells
//
//  Created by Mario on 22/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import UIKit

extension SPCViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewDataSource.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDataSource.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SPCCell.cellIdentifier) as? SPCCell else {
            return UITableViewCell()
        }
        
        if let viewModel = tableViewDataSource.dataForRowAtIndexPath(indexPath: indexPath) {
            cell.setViewModel(viewModel: viewModel)
        }
        
        return cell
    }
}

extension SPCViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tableViewDelegate.rowSelectedAtIndexPath(indexPath: indexPath)
    }
}
