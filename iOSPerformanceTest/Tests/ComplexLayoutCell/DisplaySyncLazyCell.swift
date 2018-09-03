import UIKit

private enum TaskKind: Hashable {
    case initialize(typename: String)
    case update(typename: String)
}

private var currentFrameStartTime: CFAbsoluteTime?

private func setupRunLoop() {

    let observer = CFRunLoopObserverCreate(kCFAllocatorDefault, CFRunLoopActivity.allActivities.rawValue, true, 0, { (_, activity, _) in
//        switch activity {
//        case .entry:
//            print("entry,", CFAbsoluteTimeGetCurrent())
//        case .beforeTimers:
//            print("beforeTimers,", CFAbsoluteTimeGetCurrent())
//        case .beforeSources:
//            print("beforeSources,", CFAbsoluteTimeGetCurrent())
//        case .beforeWaiting:
//            print("beforeWaiting,", CFAbsoluteTimeGetCurrent())
//        case .afterWaiting:
//            print("afterWaiting,", CFAbsoluteTimeGetCurrent())
//        case .exit:
//            print("exit,", CFAbsoluteTimeGetCurrent())
//        default:
//            fatalError()
//        }
        switch activity {
        case CFRunLoopActivity.afterWaiting:
            currentFrameStartTime = CFAbsoluteTimeGetCurrent()
        case CFRunLoopActivity.beforeWaiting:
            if let currentFrameStartTime = currentFrameStartTime {
                let currentDate = CFAbsoluteTimeGetCurrent()
                LayoutScheduler.shared.step(with: 0.010 - (currentDate - currentFrameStartTime))
            }
        default:
            break
        }
    }, nil)

    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, .commonModes)
}

private final class LayoutScheduler {
    static let shared = LayoutScheduler()

    private struct Task {
        let kind: TaskKind
        let process: ()->()
    }

    private var layoutTasks: [Task] = []
    private var estimateConsumingTime: [TaskKind: TimeInterval] = [:]

    var context = CFRunLoopObserverContext()

    private init() {
        setupRunLoop()
    }

    fileprivate func step(with remainTime: CFAbsoluteTime) {
        if layoutTasks.isEmpty { return }

        var remainTime = remainTime
        print("remainTime", remainTime)

        var processedCount = 0

        while remainTime > 0 {
            guard let task = layoutTasks.first else { break }

            let startTime = CFAbsoluteTimeGetCurrent()
            task.process()
            let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime

            let prevTime = estimateConsumingTime[task.kind]
            estimateConsumingTime[task.kind] = prevTime != nil ? (timeElapsed + prevTime!) / 2 : timeElapsed

            remainTime -= timeElapsed
            layoutTasks.remove(at: 0)
            processedCount += 1

            if let next = layoutTasks.first {
                if let estimate = estimateConsumingTime[next.kind] {
                    if remainTime > estimate {
                        continue
                    }
                }
            }
        }

        print("processedCount", processedCount)
    }

    func addTask(with kind: TaskKind, task: @escaping ()->()) {
        layoutTasks.append(Task(kind: kind, process: task))
    }
}

final class DisplaySyncLazyCell<T: UICollectionViewCell & Configurable>: UICollectionViewCell {
    private var genericCell: T?

    func configure(with data: T.ConfigData) {
        if let cell = genericCell {
            LayoutScheduler.shared.addTask(with: .update(typename: T.className)) {
                cell.configure(with: data)
            }
            return
        }

        backgroundColor = .white

        LayoutScheduler.shared.addTask(with: .initialize(typename: T.className)) {
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
