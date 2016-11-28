
import UIKit

class VerticalPosterCell: UITableViewCell {

    static let cellFixedHeight: CGFloat = 200
    fileprivate var viewModel: PosterCellViewModel?
    
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
        label.topAnchor.constraint(equalTo: self.posterImageView.bottomAnchor, constant: 5).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = AppColors.foreground
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        self.addSubview(label)
        label.leftAnchor.constraint(equalTo: self.titleLabel.leftAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: self.titleLabel.rightAnchor, constant: -50).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        button.addTarget(self, action: #selector(VerticalPosterCell.infoButtonTouchedUpInside), for: .touchUpInside)
        backgroundColor = AppColors.background
        tintColor = AppColors.tint
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VerticalPosterCell {
    
    override func prepareForReuse() {
        configure(viewModel: nil)
    }
    
    @objc func infoButtonTouchedUpInside() {
        viewModel?.infoButtonSelectionBlock()
    }
}

extension VerticalPosterCell: CollectionViewModelConfigurable {

    typealias ViewModelType = PosterCellViewModel
    
    func configure(viewModel: ViewModelType?) {
        self.viewModel = viewModel
        titleLabel.text = viewModel?.title
        subtitleLabel.text = viewModel?.subtitle
        configureImage(imageName: viewModel?.imageName)
    }
    
    private func configureImage(imageName: String?) {
        if let name = imageName {
            DispatchQueue.main.async(execute: {
                let imageView = self.posterImageView
                imageView.alpha = 0
                imageView.image = UIImage(named: name)
                UIView.animate(withDuration: 0.3, animations: {
                    imageView.alpha = 1
                })
            })
        } else {
            posterImageView.image = nil
        }
    }
}
