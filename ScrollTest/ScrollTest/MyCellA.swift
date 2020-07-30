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
        background.backgroundColor = .gray
        background.layer.cornerRadius = 12

        contentView.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        label.numberOfLines = 0
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(text: String) {
        label.text = text
    }
}

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
        shadow.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        shadow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        shadow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        shadow.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        let background = UIView()
        background.backgroundColor = .gray
        background.layer.cornerRadius = 12

        contentView.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        background.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        label.numberOfLines = 0
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(text: String) {
        label.text = text
    }
}
