
import UIKit

class PosterDetailViewController: UIViewController {
    
    let imageName: String
    var infoWebButtonSelectionBlock: (() -> Void)?
    
    lazy var posterImageView: UIImageView = {
        let posterImageView = UIImageView(frame: CGRect.zero)
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.contentMode = .scaleAspectFit
        self.view.addSubview(posterImageView)
        posterImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        posterImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        posterImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
        posterImageView.bottomAnchor.constraint(equalTo: self.infoWebButton.topAnchor, constant: -10).isActive = true
        return posterImageView
    }()
    
    lazy var infoWebButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("txt_show_info", comment: ""), for: .normal)
        button.backgroundColor = AppColors.background
        self.view.addSubview(button)
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
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
