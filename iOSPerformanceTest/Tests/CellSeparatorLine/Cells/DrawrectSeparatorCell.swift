import UIKit

private let leftMargin: CGFloat = 12.0
private let width: CGFloat = 0.5

class DrawrectSeparatorCell: UICollectionViewCell {
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard let context = UIGraphicsGetCurrentContext() else { fatalError() }

        context.setStrokeColor(UIColor.lightGray.cgColor)
        context.setLineWidth(width)
        context.move(to: CGPoint(x: leftMargin, y: frame.height - width * 2))
        context.addLine(to: CGPoint(x: frame.width - width, y: frame.height - width * 2))
        context.strokePath()
    }
}
