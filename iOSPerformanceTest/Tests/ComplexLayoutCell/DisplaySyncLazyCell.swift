import UIKit

private enum TaskKind: Hashable {
    case initialize(typename: String)
    case update(typename: String)
}

private var currentFrameStartTime: CFAbsoluteTime?
private var processFinishedTime: CFAbsoluteTime = 0.0
private var targetTimestamp: CFAbsoluteTime = -CFAbsoluteTime.greatestFiniteMagnitude
private var displayInterval: TimeInterval = 1.0 / 60.0

private func setupRunLoop() {

    let observer = CFRunLoopObserverCreate(kCFAllocatorDefault, CFRunLoopActivity.allActivities.rawValue, true, 0, { (_, activity, _) in
        switch activity {
        case .entry:
            print("entry,")
        case .beforeTimers:
            print("beforeTimers,")
        case .beforeSources:
            print("beforeSources,")
        case .beforeWaiting:
            print("beforeWaiting,")
        case .afterWaiting:
            print("afterWaiting,", CFAbsoluteTimeGetCurrent() - processFinishedTime)
        case .exit:
            print("exit,")
        default:
            fatalError()
        }

        switch activity {
        case CFRunLoopActivity.afterWaiting:
            break
        case CFRunLoopActivity.beforeWaiting:
//            if let startTime = currentFrameStartTime {
//                let currentDate = CFAbsoluteTimeGetCurrent()
//                LayoutScheduler.shared.step(within: displayInterval - (currentDate - startTime))
//                currentFrameStartTime = nil
//            }
            LayoutScheduler.shared.step(within: targetTimestamp - CFAbsoluteTimeGetCurrent())
        default:
            break
        }
    }, nil)

    CFRunLoopAddObserver(RunLoop.main.getCFRunLoop(), observer, .commonModes)
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

        let l = CADisplayLink.init(target: self, selector: #selector(link))
        l.add(to: .main, forMode: .commonModes)
    }

    @objc private func link(_ link: CADisplayLink) {
        print("CADisplayLink begin")
        currentFrameStartTime = CFAbsoluteTimeGetCurrent()
        displayInterval = link.duration
        targetTimestamp = CFAbsoluteTimeGetCurrent() + link.duration
        print("CADisplayLink end")
    }

    fileprivate func step(within remainTime: CFAbsoluteTime) {
        var processedCount = 0
        let input = remainTime
        var remainTime = remainTime
        defer {
            print("input", input, ",remainTime", remainTime, "processedCount", processedCount)
            processFinishedTime = CFAbsoluteTimeGetCurrent()
        }
        if layoutTasks.isEmpty { return }

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

                break
            }
        }
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
