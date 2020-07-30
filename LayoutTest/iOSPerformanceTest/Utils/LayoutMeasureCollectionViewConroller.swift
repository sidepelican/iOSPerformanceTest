import UIKit

class LayoutMeasureCollectionViewConroller: UICollectionViewController {
    private var measureCompletion: MeasureCompletion?

    override func viewWillLayoutSubviews() {
        measureCompletion = startMeasure()

        super.viewWillLayoutSubviews()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        measureCompletion?()
    }
}
