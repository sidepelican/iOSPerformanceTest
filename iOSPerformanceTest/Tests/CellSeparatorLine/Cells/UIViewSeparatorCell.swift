import UIKit

class UIViewSeparatorCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)

        let border = UIView()
        border.backgroundColor = .lightGray
        contentView.addSubview(border)
        border.translatesAutoresizingMaskIntoConstraints = false
        border.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        border.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
        border.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        border.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
