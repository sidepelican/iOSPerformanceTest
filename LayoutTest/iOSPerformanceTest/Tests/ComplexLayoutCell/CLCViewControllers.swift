import UIKit

class CLCNormalViewController: CLCBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(UINib(nibName: "ContentCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ContentCell
        cell.configure(with: items[indexPath.row])
        return cell
    }
}

class CLCLazyViewController: CLCBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(LazyCell<ContentCell>.self, forCellWithReuseIdentifier: "Cell")
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! LazyCell<ContentCell>
        cell.configure(with: items[indexPath.row])
        return cell
    }
}

class CLCSequentialLazyViewController: CLCBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(SequentialLazyCell<ContentCell>.self, forCellWithReuseIdentifier: "Cell")
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SequentialLazyCell<ContentCell>
        cell.configure(with: items[indexPath.row])
        return cell
    }
}

class CLCDisplaySyncLazyViewController: CLCBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(DisplaySyncLazyCell<ContentCell>.self, forCellWithReuseIdentifier: "Cell")
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DisplaySyncLazyCell<ContentCell>
        cell.configure(with: items[indexPath.row])
        return cell
    }
}

class CLCRunloopLazyViewController: CLCBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(RunloopLazyCell<ContentCell>.self, forCellWithReuseIdentifier: "Cell")
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RunloopLazyCell<ContentCell>
        cell.configure(with: items[indexPath.row])
        return cell
    }
}

class CLCImagedViewController: CLCBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(ImagedNibCell<ContentCell>.self, forCellWithReuseIdentifier: "Cell")
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImagedNibCell<ContentCell>
        cell.configure(with: items[indexPath.row])
        return cell
    }
}
