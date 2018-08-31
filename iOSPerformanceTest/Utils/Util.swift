import Foundation
import PKHUD

private let delay: TimeInterval = 1.5

typealias MeasureCompletion = () -> ()
func measure(_ file: String = #file, function: String = #function, measureBlock: (MeasureCompletion) -> ()) {
    HUD.allowsInteraction = true
    let startTime = CFAbsoluteTimeGetCurrent()

    let completion = {
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        let message = "\(function) \(timeElapsed) seconds"
        print(message)
        HUD.flash(.label(message), delay: delay)
    }

    measureBlock(completion)
}

func measure(_ function: String = #function, measureBlock: () -> ()) {
    HUD.allowsInteraction = true
    let startTime = CFAbsoluteTimeGetCurrent()

    measureBlock()

    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    let message = "\(function) \(timeElapsed) seconds"
    print(message)
    HUD.flash(.label(message), delay: delay)
}
