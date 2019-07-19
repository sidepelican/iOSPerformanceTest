import UIKit

private func makeImage(filledWith fillColor: UIColor, ovalIn: CGRect) -> UIImage? {
    let bezierPath = UIBezierPath(ovalIn: ovalIn)
    if bezierPath.bounds.width == 0 || bezierPath.bounds.height == 0 {
        return nil
    }

    return UIGraphicsImageRenderer(size: bezierPath.bounds.size).image { context in
        fillColor.setFill()
        bezierPath.fill()
        bezierPath.addClip()
    }
}

final class RBBImageCell: UICollectionViewCell {
    private let button = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true

        button.setBackgroundImage(makeBackgroundImage(frame: frame), for: .normal)
        button.setBackgroundImage(makeBackgroundImage(frame: frame), for: .highlighted)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func makeBackgroundImage(frame: CGRect) -> UIImage? {
        let minLength = min(frame.width, frame.height)
        let image = makeImage(filledWith: UIColor.random(), ovalIn: CGRect(origin: .zero, size: CGSize(width: minLength, height: minLength)))

        return image?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: minLength / 2, bottom: 0, right: minLength / 2))
    }
}
