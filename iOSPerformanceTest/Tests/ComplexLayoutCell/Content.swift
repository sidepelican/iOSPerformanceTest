import UIKit

struct Content: Hashable {
    let title: String
    let description: String
    let image: UIImage?
}

extension Content {
    static func makeContents() -> [Content] {
        let wordGenerator = RandomWordGenerator.shared
        let icons = IconGenerator.makeIcons()
        return (0..<100)
            .compactMap { _ in icons.randomElement() }
            .map { icon in
            let description = (0..<Int.random(in: 7...10))
                .map { _ in wordGenerator.next() }
                .joined(separator: " ")
            return Content(title: wordGenerator.next(),
                           description: description,
                           image: icon.image)
        }
    }
}
