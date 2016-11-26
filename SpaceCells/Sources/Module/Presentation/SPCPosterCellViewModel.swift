//
//  SPCPosterCellViewModel.swift
//  SpaceCells
//
//  Created by Mario on 26/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import Foundation

typealias SPCPosterCellViewModelInfoSelectionBlock = () -> Void

struct SPCPosterCellViewModel {
    let title: String
    let subtitle: String
    let imageName: String
    let infoButtonSelectionBlock: SPCPosterCellViewModelInfoSelectionBlock
}
