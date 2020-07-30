import UIKit

final class RBBAssetImageCell: UICollectionViewCell {
    private let button = UIButton(type: .custom)

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true

        let image = UIImage(named: "circle_radius15")?.withRenderingMode(.alwaysTemplate).resizableImage(withCapInsets: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15))
        button.setBackgroundImage(image, for: .normal)
        button.tintColor = UIColor.random()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
