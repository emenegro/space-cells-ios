
import UIKit

protocol ListView: class {
    func reloadData()
}

class ListViewController: UIViewController {
    
    let presenter: ListPresenter
    let tableViewCollectionable: AnyCollectionable<PosterCellViewModel>
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = AppColors.backgroundSecondary
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.register(VerticalPosterCell.self)
        return tableView
    }()
    
    init(presenter: ListPresenter, tableViewCollectionable: AnyCollectionable<PosterCellViewModel>) {
        self.presenter = presenter
        self.tableViewCollectionable = tableViewCollectionable
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListViewController {

    override func loadView() {
        self.view = tableView
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        setupView()
	}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

    private func setupView() {
        edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        view.backgroundColor = AppColors.backgroundSecondary
        title = presenter.title
    }
}

extension ListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewCollectionable.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCollectionable.numberOfRows(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel: PosterCellViewModel? = tableViewCollectionable.viewModelForRowAtIndexPath(indexPath: indexPath)
        let cell: VerticalPosterCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(viewModel: viewModel)
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tableViewCollectionable.rowSelectedAtIndexPath(indexPath: indexPath)
    }
}

extension ListViewController: ListView {
    
    func reloadData() {
        tableView.reloadData()
    }
}
