import Foundation

func measure<T>(title: String = "", function: String = #function, operation: () -> T) -> T {
    let startTime = CFAbsoluteTimeGetCurrent()
    let result = operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("\(function)::\(title), \(timeElapsed) seconds")
    return result
}
