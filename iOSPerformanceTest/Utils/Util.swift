import Foundation
import PKHUD

private let delay: TimeInterval = 1.5

typealias MeasureCompletion = () -> ()
func startMeasure(_ file: String = #file, function: String = #function) -> MeasureCompletion {
    HUD.allowsInteraction = true
    let identifier = makeIdentifier(file: file, function: function)
    let startTime = CFAbsoluteTimeGetCurrent()

    let completion = {
        let timeElapsed = (CFAbsoluteTimeGetCurrent() - startTime) * 1000
        let message = "\(identifier) \(timeElapsed) ms"
        print(message)
        HUD.flash(.label(message), delay: delay)
    }

    return completion
}

func measure(_ file: String = #file, function: String = #function, measureBlock: () -> ()) {
    HUD.allowsInteraction = true
    let identifier = makeIdentifier(file: file, function: function)
    let startTime = CFAbsoluteTimeGetCurrent()

    measureBlock()

    let timeElapsed = (CFAbsoluteTimeGetCurrent() - startTime) * 1000
    let message = "\(identifier) \(timeElapsed) ms"
    print(message)
    HUD.flash(.label(message), delay: delay)
}

private func makeIdentifier(file: String, function: String) -> String {
    var trimmedFile: String
    if let lastIndex = file.lastIndex(of: "/") {
        trimmedFile = String(file[file.index(after: lastIndex) ..< file.endIndex])
    } else {
        trimmedFile = file
    }
    trimmedFile = trimmedFile.replacingOccurrences(of: ".swift", with: "")
    return "\(trimmedFile) (\(function))"
}
