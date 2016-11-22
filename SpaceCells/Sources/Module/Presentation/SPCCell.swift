//
//  SPCCell.swift
//  SpaceCells
//
//  Created by Mario on 21/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import UIKit

typealias SPCCellViewModelInfoSelectionBlock = (_ index: Int) -> Void
struct SPCCellViewModel {
    let index: Int
    let text: String
    let secondaryText: String
    let imageName: String
    let infoButtonSelectionBlock: SPCCellViewModelInfoSelectionBlock
}

class SPCCell: UITableViewCell {

    static let cellIdentifier = "SPCCellIdentifier"
    static let cellFixedHeight: CGFloat = 170
    fileprivate var viewModel: SPCCellViewModel!
    
    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        self.addSubview(imageView)
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(label)
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        label.topAnchor.constraint(equalTo: self.posterImageView.bottomAnchor, constant: 5).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        self.addSubview(label)
        label.leftAnchor.constraint(equalTo: self.titleLabel.leftAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: self.titleLabel.rightAnchor).isActive = true
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .infoDark)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        button.topAnchor.constraint(equalTo: self.titleLabel.topAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: self.subtitleLabel.rightAnchor).isActive = true
        return button
    }()
}

extension SPCCell {
    
    func setViewModel(viewModel: SPCCellViewModel) {
        self.viewModel = viewModel
        posterImageView.image = UIImage(named: viewModel.imageName)
        titleLabel.text = viewModel.text
        subtitleLabel.text = viewModel.secondaryText
        button.addTarget(self, action: #selector(SPCCell.infoButtonTouchedUpInside), for: .touchUpInside)
    }
    
    @objc func infoButtonTouchedUpInside() {
        viewModel.infoButtonSelectionBlock(viewModel.index)
    }
}
