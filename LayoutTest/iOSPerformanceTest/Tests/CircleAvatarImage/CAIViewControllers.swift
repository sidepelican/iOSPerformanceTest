import UIKit

class CAINormalViewController: CAIBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(CircleAvatarCell.self, forCellWithReuseIdentifier: "Cell")
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CircleAvatarCell
        cell.configure(with: items[indexPath.row])
        return cell
    }
}
