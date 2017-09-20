
import UIKit

class PosterDetailViewController: UIViewController {
    
    let imageName: String
    var infoWebButtonSelectionBlock: (() -> Void)?
    
    lazy var posterImageView: UIImageView = {
        let posterImageView = UIImageView(frame: CGRect.zero)
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.contentMode = .scaleAspectFit
        self.view.addSubview(posterImageView)
        NSLayoutConstraint.activate([
            posterImageView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            posterImageView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            posterImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            posterImageView.bottomAnchor.constraint(equalTo: self.infoWebButton.topAnchor, constant: -10)
            ])
        return posterImageView
    }()
    
    lazy var infoWebButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(L10n.showInfo.localized, for: .normal)
        button.backgroundColor = AppColors.background
        self.view.addSubview(button)
        NSLayoutConstraint.activate([
            button.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            button.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 44)
            ])
        return button
    }()
    
    init(title: String, imageName: String) {
        self.imageName = imageName
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PosterDetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        view.backgroundColor = AppColors.backgroundSecondary
        
        infoWebButton.addTarget(self, action: #selector(PosterDetailViewController.infoWebButtonTouchedUpInside), for: .touchUpInside)
        posterImageView.image = UIImage(named: imageName)
    }
    
    @objc func infoWebButtonTouchedUpInside() {
        infoWebButtonSelectionBlock?()
    }
}
