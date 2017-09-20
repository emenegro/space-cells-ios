
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
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 125)
            ])
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 26)
        label.textColor = AppColors.foreground
        self.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.posterImageView.bottomAnchor, constant: 5),
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10)
            ])
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
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: self.titleLabel.leftAnchor),
            label.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            label.rightAnchor.constraint(equalTo: self.titleLabel.rightAnchor, constant: -50),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
            ])
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .infoDark)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            button.rightAnchor.constraint(equalTo: self.titleLabel.rightAnchor)
            ])
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

extension VerticalPosterCell: CollectionableViewModelCellConfigurable {

    func configure(viewModel: PosterCellViewModel?) {
        self.viewModel = viewModel
        titleLabel.text = viewModel?.title
        subtitleLabel.text = viewModel?.subtitle
        configureImage(imageName: viewModel?.imageName)
    }
    
    private func configureImage(imageName: String?) {
        if let name = imageName {
            posterImageView.image = UIImage(named: name)
        } else {
            posterImageView.image = nil
        }
    }
}
