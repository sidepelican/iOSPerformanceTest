import UIKit

final class RBBLayerCell: UICollectionViewCell {
    private let button = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true

        button.backgroundColor = UIColor.random()

        button.layer.cornerRadius = min(frame.width, frame.height) / 2
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
