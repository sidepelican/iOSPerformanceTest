import UIKit

protocol Configurable {
    associatedtype ConfigData: Hashable
    func configure(with data: ConfigData)
}

private var cells: [String: UICollectionViewCell] = [:]
private var imageCache: [AnyHashable: UIImage] = [:]

class DelayedCell<T: UICollectionViewCell & Configurable>: UICollectionViewCell {
    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with data: T.ConfigData) {
        if let image = imageCache[AnyHashable(data)] {
            imageView.image = image
            return
        }

        let bounds = self.bounds
        let className = String(describing: type(of: T.self))
        var cell: T! = cells[className] as? T
        if cell == nil {
            cell = T(frame: bounds)
            cells[className] = cell
        }

        DispatchQueue.main.async {
            if cell.superview == nil {
                self.addSubview(cell)
            }
            let image = UIGraphicsImageRenderer(bounds: bounds).image { context in
                cell.configure(with: data)
                cell.layer.render(in: context.cgContext)
            }
            imageCache[AnyHashable(data)] = image
            self.imageView.image = image
            cell.removeFromSuperview()
        }
    }
}
