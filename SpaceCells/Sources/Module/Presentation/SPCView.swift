//
//  SPCView.swift
//  SpaceCells
//
//  Created by Mario on 3/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import UIKit

protocol SPCView: class {
    func reloadData()
}

class SPCViewController: UIViewController {
    
    let presenter: SPCPresenter
    let tableViewDataSource: CollectionDataSource
    let tableViewDelegate: CollectionDelegate
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = SPCPosterCell.cellFixedHeight
        tableView.separatorStyle = .none
        tableView.register(SPCPosterCell.self)
        return tableView
    }()
    
    init(presenter: SPCPresenter, tableViewDataSource: CollectionDataSource, tableViewDelegate: CollectionDelegate) {
        self.presenter = presenter
        self.tableViewDataSource = tableViewDataSource
        self.tableViewDelegate = tableViewDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SPCViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
        edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        view.backgroundColor = AppColors.background
        title = presenter.title
        
		view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
	}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
}

extension SPCViewController: SPCView {
    
    func reloadData() {
        tableView.reloadData()
    }
}
