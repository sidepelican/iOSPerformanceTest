import UIKit

final class MyCellD: UICollectionViewCell, TestCellProtocol {
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.pinEdgesToSuperView()
        label.textAlignment = .center

        label.layer.cornerRadius = 12
        label.clipsToBounds = true

        label.backgroundColor = .lightGray

        contentView.layer.shadowColor = UIColor.purple.cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = .init(width: 0, height: 1)
        contentView.layer.shadowRadius = 2
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.layer.shadowPath = UIBezierPath(roundedRect: contentView.bounds, cornerRadius: 12).cgPath
    }

    func configure(text: String) {
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.gray.withAlphaComponent(0.8)
        shadow.shadowOffset = .init(width: 6, height: 6)
        shadow.shadowBlurRadius = 0.8

        label.attributedText = NSAttributedString(string: text, attributes: [
            .shadow: shadow,
        ])
    }
}
