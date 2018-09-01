import UIKit

final class LazyCell<T: UICollectionViewCell & Configurable>: UICollectionViewCell {
    private var genericCell: T?

    func configure(with data: T.ConfigData) {
        if let cell = genericCell {
            cell.configure(with: data)
            return
        }

        backgroundColor = .white

        DispatchQueue.global().async {
            DispatchQueue.main.async {
                let cell = UINib(nibName: T.className, bundle: nil).instantiate(withOwner: nil).first as! T
                self.genericCell = cell
                cell.configure(with: data)
                self.contentView.addSubview(cell)

                cell.translatesAutoresizingMaskIntoConstraints = false
                cell.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
                cell.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
                cell.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
                cell.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true

                cell.alpha = 0.0
                UIView.animate(withDuration: 0.2) {
                    cell.alpha = 1.0
                }
            }
        }
    }
}
