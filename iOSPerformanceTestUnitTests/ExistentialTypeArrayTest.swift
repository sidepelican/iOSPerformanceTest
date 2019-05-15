import XCTest

private protocol CounterProtocol {
    var value: Int { get }
    func count()
}

private protocol CounterClassProtocol: AnyObject {
    var value: Int { get }
    func count()
}

private class Counter {
    var value: Int = 0
    func count() {
        value += 1
    }
}

extension Counter: CounterProtocol {}
extension Counter: CounterClassProtocol {}

private let loop = 10_000_000

private func use<T>(_ array: [T]) -> Int {
    var array = array
    array.remove(at: array.count / 2 - 1)
    return array.count
}

class ExistentialTypeArrayTest: XCTestCase {
    func testBasicProtocol() {
        let baseArray = [CounterProtocol](repeating: Counter(), count: loop)

        self.measure {
            var array: [CounterProtocol] = baseArray
            array.remove(at: 0)
            print(use(array))
        }
    }

    func testClassOnlyProtocol() {
        let baseArray = [CounterClassProtocol](repeating: Counter(), count: loop)

        self.measure {
            var array: [CounterClassProtocol] = baseArray
            array.remove(at: 0)
            print(use(array))
        }
    }
}
