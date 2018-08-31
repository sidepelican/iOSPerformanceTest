import UIKit

class LabelCell: UICollectionViewCell {
    private var label: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        let innerView = UIView()
        innerView.backgroundColor = .white
        contentView.addSubview(innerView)
        innerView.translatesAutoresizingMaskIntoConstraints = false
        innerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        innerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        innerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        innerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true

        let label = UILabel()
        innerView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: innerView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: innerView.centerYAnchor).isActive = true

        self.label = label

        usleep(50000)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    func configure(with data: String) {
        label.text = data
        contentView.backgroundColor = .random()
    }
}

extension LabelCell: Configurable {
    typealias ConfigData = String
}

private extension UIColor {
    static func random() -> UIColor {
        let rand = arc4random()
        var r = CGFloat((rand >> 32) & 0xFF) / 255.0
        var g = CGFloat((rand >> 16) & 0xFF) / 255.0
        var b = CGFloat((rand >> 0 ) & 0xFF) / 255.0

        if r + g + b < 1.0 {
            r = r * 0.8 + 0.2
            g = g * 0.8 + 0.2
            b = b * 0.8 + 0.2
        }

        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}
