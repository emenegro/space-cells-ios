
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
        tableView.backgroundColor = AppColors.backgroundSecondary
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.register(SPCVerticalPosterCell.self)
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
        view.backgroundColor = AppColors.backgroundSecondary
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

extension SPCViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewDataSource.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDataSource.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let viewModel: SPCPosterCellViewModel? = tableViewDataSource.viewModelForRowAtIndexPath(indexPath: indexPath)
        let cell: SPCVerticalPosterCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(viewModel: viewModel)
        
        return cell
    }
}

extension SPCViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tableViewDelegate.rowSelectedAtIndexPath(indexPath: indexPath)
    }
}

extension SPCViewController: SPCView {
    
    func reloadData() {
        tableView.reloadData()
    }
}
