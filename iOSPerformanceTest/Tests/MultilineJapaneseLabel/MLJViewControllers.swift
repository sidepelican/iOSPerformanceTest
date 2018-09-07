import UIKit

class MLJNormalViewController: MLJBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(UINib(nibName: "JPContentCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! JPContentCell
        cell.configure(with: items[indexPath.row])
        return cell
    }
}
