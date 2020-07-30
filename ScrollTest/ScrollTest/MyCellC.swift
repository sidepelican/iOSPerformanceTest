import UIKit

final class MyCellC: UICollectionViewCell, TestCellProtocol {
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let background = UIImageView(image: UIImage(named: "shadow"))

        contentView.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.pinEdgesToSuperView(inset: -10)

        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.pinEdgesToSuperView()
        label.textAlignment = .center

        label.backgroundColor = .lightGray

        label.layer.cornerRadius = 12
        label.clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static var once: Bool = false

    func configure(text: String) {
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.gray.withAlphaComponent(0.8)
        shadow.shadowOffset = .init(width: 6, height: 6)
        shadow.shadowBlurRadius = 0.8

        label.attributedText = NSAttributedString(string: text, attributes: [
            .shadow: shadow,
        ])

//        if !Self.once {
//            label.isHidden = true
//            defer { label.isHidden = false }
//
//            setNeedsLayout()
//            layoutIfNeeded()
//            let format = UIGraphicsImageRendererFormat()
//            format.scale = 3
//            let r = UIGraphicsImageRenderer(size: CGSize.init(
//                width: self.layer.bounds.size.width + 20,
//                height: self.layer.bounds.size.height + 20
//            ), format: format)
//            let pngData =  r.pngData { (context) in
//                context.cgContext.translateBy(x: 10, y: 10)
//                self.layer.render(in: context.cgContext)
//            }
//            try! pngData.write(to: URL.init(fileURLWithPath: "/Users/kenta-okamura/Desktop/shadow.png"))
//
//            Self.once = true
//        }
    }
}
