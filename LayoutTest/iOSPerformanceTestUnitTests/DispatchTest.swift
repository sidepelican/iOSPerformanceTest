import XCTest

private protocol CounterProtocol {
    var value: Int { get }
    func count()
}

private protocol CounterClassProtocol: AnyObject {
    var value: Int { get }
    func count()
}

private class Counter: NSObject {
    var value: Int = 0
    func count() {
        value += 1
    }
}

extension Counter: CounterProtocol {}
extension Counter: CounterClassProtocol {}

private let loop = 50_000_000

class DispatchTest: XCTestCase {
    func testBasicProtocol() {
        let counterProtocol: CounterProtocol = Counter()

        self.measure {
            for _ in 0..<loop { counterProtocol.count() }
            print(counterProtocol.value)
        }
    }

    func testClassOnlyProtocol() {
        let counterClassProtocol: CounterClassProtocol = Counter()

        self.measure {
            for _ in 0..<loop { counterClassProtocol.count() }
            print(counterClassProtocol.value)
        }
    }

    func testProvider() {
        class Provider {
            private let _counter = Counter()
            var counter: CounterProtocol {
                return _counter
            }
        }

        let provider = Provider()
        self.measure {
            for _ in 0..<loop { provider.counter.count() }
            print(provider.counter.value)
        }
    }

    func testProviderClassOnly() {
        class Provider {
            private let _counter = Counter()
            var counter: CounterClassProtocol {
                return _counter
            }
        }

        let provider = Provider()
        self.measure {
            for _ in 0..<loop { provider.counter.count() }
            print(provider.counter.value)
        }
    }
}
