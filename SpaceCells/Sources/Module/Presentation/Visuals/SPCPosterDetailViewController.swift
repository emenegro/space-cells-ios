//
//  SPCPosterDetailViewController.swift
//  SpaceCells
//
//  Created by Mario on 23/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import UIKit

class SPCPosterDetailViewController: UIViewController {
    
    let imageName: String
    var posterImageView: UIImageView!
    
    init(title: String, imageName: String) {
        self.imageName = imageName
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SPCPosterDetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        view.backgroundColor = AppColors.background
        
        posterImageView = UIImageView(frame: CGRect.zero)
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.image = UIImage(named: imageName)
        view.addSubview(posterImageView)
        posterImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        posterImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        posterImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
