import UIKit

private let padding: CGFloat = 7

final class TagLabelCell: UICollectionViewCell {
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.layer.cornerRadius = frame.height / 2
        contentView.layer.borderColor = UIColor.brown.cgColor
        contentView.layer.borderWidth = 2.0
        contentView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)

        contentView.addSubview(label)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(_ word: String) {
        label.text = word
    }

    static func sizeWithAttributes(for word: String) -> CGSize {
        let labelSize = (word as NSString).size(withAttributes: nil)

        let height = labelSize.height + padding * 2
        return CGSize(width: labelSize.width + padding * 2 + height, height: height)
    }

    static func sizeWithThatFits(for word: String) -> CGSize {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = word
        let labelSize = label.sizeThatFits(CGSize(width: 1000, height: 15))

        let height = labelSize.height + padding * 2
        return CGSize(width: labelSize.width + padding * 2 + height, height: height)
    }
}
