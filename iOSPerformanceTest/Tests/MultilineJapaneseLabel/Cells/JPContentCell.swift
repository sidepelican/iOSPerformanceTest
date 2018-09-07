import UIKit

class JPContentCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.numberOfLines = 3

        nameLabel.font = UIFont.systemFont(ofSize: 11, weight: .thin)
    }

    func configure(with data: JapaneseContent) {
        imageView.image = data.icon
        titleLabel.text = data.title
        nameLabel.text = data.authorName
    }
}
