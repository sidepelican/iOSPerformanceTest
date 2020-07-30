import UIKit

private let staticItems = Content.makeContents()

class CLCBaseViewController: LayoutMeasureCollectionViewConroller, UICollectionViewDelegateFlowLayout {
    let items = staticItems

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.isPrefetchingEnabled = false
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: collectionView.bounds.width * 0.67, height: 160)
        }

        return CGSize(width: collectionView.bounds.width / 10 - 1, height: 70)
    }
}

