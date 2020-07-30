Our UICollectionView has a lot of cells and it is heavy to initialize them.


```swift
class AwesomeCell: UICollectionViewCell {
    private var label: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        let label = UILabel()
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        ...

        usleep(50000) // oops! 🐢
    }
    ...
}
```

Is this a good idea to resolve the performance issue? 🤔

(`cell` is a sigleton)

```swift
let image = UIGraphicsImageRenderer(bounds: bounds).image { context in
    cell.configure(with: data)
    cell.layer.render(in: context.cgContext)
}
wrapperCell.imageView.image = image
```

This repository is for testing this.
