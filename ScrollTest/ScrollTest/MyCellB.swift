import UIKit

final class MyCellB: UICollectionViewCell, TestCellProtocol {
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let shadow = UIView()
        shadow.backgroundColor = .white
        shadow.layer.shadowColor = UIColor.red.cgColor
        shadow.layer.shadowOpacity = 1
        shadow.layer.shadowOffset = .init(width: 0, height: 1)
        shadow.layer.shadowRadius = 2
        shadow.layer.cornerRadius = 12
        shadow.layer.masksToBounds = false
        shadow.layer.rasterizationScale = UIScreen.main.scale
        shadow.layer.shouldRasterize = true
        contentView.addSubview(shadow)
        shadow.translatesAutoresizingMaskIntoConstraints = false
        shadow.pinEdgesToSuperView()

        let background = UIView()
        background.backgroundColor = .lightGray
        background.layer.cornerRadius = 12
        background.clipsToBounds = true

        contentView.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.pinEdgesToSuperView()

        background.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.pinEdgesToSuperView()
        label.textAlignment = .center

        label.backgroundColor = .lightGray
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
