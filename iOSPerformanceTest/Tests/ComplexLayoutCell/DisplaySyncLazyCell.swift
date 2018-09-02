import UIKit

private final class LayoutScheduler {
    static let shared = LayoutScheduler()

    private var layoutTasks: [()->()] = []

    private init() {
        let link = CADisplayLink(target: self, selector: #selector(step))
        link.add(to: .main, forMode: .commonModes)
    }

    @objc private func step(displayLink: CADisplayLink) {
        if layoutTasks.isEmpty { return }

        let startTime = CFAbsoluteTimeGetCurrent()
        for _ in 0..<2 where !layoutTasks.isEmpty {
            let task = layoutTasks.remove(at: 0)
            task()
        }
        let timeElapsed = (CFAbsoluteTimeGetCurrent() - startTime) * 1000
        print("\(timeElapsed) ms")
    }

    func addTask(_ task: @escaping ()->()) {
        layoutTasks.append(task)
    }
}

final class DisplaySyncLazyCell<T: UICollectionViewCell & Configurable>: UICollectionViewCell {
    private var genericCell: T?

    func configure(with data: T.ConfigData) {
        if let cell = genericCell {
            cell.configure(with: data)
            return
        }

        backgroundColor = .white

        LayoutScheduler.shared.addTask {
            let cell = UINib(nibName: T.className, bundle: nil).instantiate(withOwner: nil).first as! T
            self.genericCell = cell
            cell.configure(with: data)
            self.contentView.addSubview(cell)

            cell.translatesAutoresizingMaskIntoConstraints = false
            cell.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
            cell.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
            cell.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
            cell.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true

            cell.alpha = 0.0
            UIView.animate(withDuration: 0.2) {
                cell.alpha = 1.0
            }
        }
    }
}
