import UIKit

final class MyCellA: UICollectionViewCell, TestCellProtocol {
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.shadowColor = UIColor.blue.cgColor
        layer.shadowOffset = .init(width: 0, height: 1)
        layer.shadowRadius = 2
        layer.shadowOpacity = 1
        layer.masksToBounds = false

        let background = UIView()
        background.backgroundColor = .lightGray
        background.layer.cornerRadius = 12

        contentView.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.pinEdgesToSuperView()

        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.pinEdgesToSuperView()
        label.textAlignment = .center

        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = .init(width: 6, height: 6)
        label.layer.shadowRadius = 0.8
        label.layer.shadowOpacity = 0.8
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(text: String) {
        label.text = text
    }
}
