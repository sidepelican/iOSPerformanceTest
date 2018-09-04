import UIKit

class CSLUIViewViewController: CSLBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(UIViewSeparatorCell.self, forCellWithReuseIdentifier: "Cell")
    }
}

class CSLCALayerViewController: CSLBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(CALayerSeparatorCell.self, forCellWithReuseIdentifier: "Cell")
    }
}

class CSLDrawrectViewController: CSLBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(DrawrectSeparatorCell.self, forCellWithReuseIdentifier: "Cell")
    }
}
