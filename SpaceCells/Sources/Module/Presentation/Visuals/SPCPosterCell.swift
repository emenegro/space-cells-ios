//
//  SPCPosterCell.swift
//  SpaceCells
//
//  Created by Mario on 21/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import UIKit

typealias SPCPosterCellViewModelInfoSelectionBlock = (_ index: Int) -> Void
struct SPCPosterCellViewModel {
    let index: Int
    let title: String
    let subtitle: String
    let imageName: String
    let infoButtonSelectionBlock: SPCPosterCellViewModelInfoSelectionBlock
}

class SPCPosterCell: UITableViewCell {

    static let cellFixedHeight: CGFloat = 200
    fileprivate var viewModel: SPCPosterCellViewModel!
    
    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        self.addSubview(imageView)
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 125).isActive = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 26)
        label.textColor = AppColors.foreground
        self.addSubview(label)
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        label.topAnchor.constraint(equalTo: self.posterImageView.bottomAnchor, constant: 5).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = AppColors.secondary
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        self.addSubview(label)
        label.leftAnchor.constraint(equalTo: self.titleLabel.leftAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: self.titleLabel.rightAnchor, constant: -50).isActive = true
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .infoDark)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        button.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: self.titleLabel.rightAnchor).isActive = true
        return button
    }()
    
    @objc func infoButtonTouchedUpInside() {
        viewModel.infoButtonSelectionBlock(viewModel.index)
    }
}

extension SPCPosterCell: CollectionViewModelConfigurable {

    typealias ViewModelType = SPCPosterCellViewModel
    
    func configure(viewModel: ViewModelType) {
        self.viewModel = viewModel
        posterImageView.image = UIImage(named: viewModel.imageName)
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        button.addTarget(self, action: #selector(SPCPosterCell.infoButtonTouchedUpInside), for: .touchUpInside)
    }
}
