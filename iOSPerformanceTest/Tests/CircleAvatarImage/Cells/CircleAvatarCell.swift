import UIKit

class CircleAvatarCell: UICollectionViewCell {
    private let imageView = UIImageView()
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .white

        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.0).isActive = true
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        imageView.layer.cornerRadius = frame.width / 2
        imageView.layer.masksToBounds = true

        label.font = UIFont.systemFont(ofSize: 10, weight: .thin)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with data: Content) {
        imageView.image = data.image
        label.text = data.title
    }
}
