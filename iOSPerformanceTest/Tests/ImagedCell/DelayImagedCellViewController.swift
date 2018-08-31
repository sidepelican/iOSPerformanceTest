import UIKit

private let items = (1...200).map(String.init)

class DelayImagedCellViewController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(DelayedCell<LabelCell>.self, forCellWithReuseIdentifier: "Delay")
        collectionView?.isPrefetchingEnabled = false
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Delay", for: indexPath) as! DelayedCell<LabelCell>
        cell.configure(with: items[indexPath.row])
        return cell
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
