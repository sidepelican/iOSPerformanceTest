import UIKit

final class LSECacheViewController: LayoutMeasureCollectionViewConroller, UICollectionViewDelegateFlowLayout {
    private var items: [String] = (0..<400).map { _ in RandomWordGenerator.shared.next() }

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.backgroundColor = .white

        collectionView?.register(TagLabelCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView?.isPrefetchingEnabled = false

        collectionView?.delegate = self
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TagLabelCell
        cell.configure(items[indexPath.row])
        return cell
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = items[indexPath.row]
        if let cache = globalSizeCache[item] {
            return cache
        }

        let result = TagLabelCell.sizeWithThatFits(for: item)
        globalSizeCache[item] = result
        return result
    }
}

private var globalSizeCache: [String: CGSize] = [:]
