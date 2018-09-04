import UIKit

private let leftMargin: CGFloat = 12.0
private let width: CGFloat = 0.5

class CALayerSeparatorCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)

        let border = CALayer()
        border.backgroundColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: leftMargin,
                              y: frame.height - width,
                              width: frame.width - leftMargin,
                              height: width)
        contentView.layer.addSublayer(border)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
