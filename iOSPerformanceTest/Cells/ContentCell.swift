import UIKit

class ContentCell: UICollectionViewCell, Configurable, UITableViewDelegate, UITableViewDataSource {
    typealias ConfigData = Content
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 10
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    func configure(with data: Content) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        imageView.image = data.image
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.backgroundColor = .random()
        return cell
    }
}
