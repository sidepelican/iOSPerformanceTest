import SpriteKit

struct Icon {
    let image: UIImage
}

class IconGenerator {
    static func makeIcons() -> [Icon] {
        return iconNames.map {
            Icon(image: UIImage(named: $0)!)
        }
    }

    static func makeIconsFromTextureAtlas() -> [Icon] {
        let spriteframe = SKTextureAtlas(named: "icons")
        return iconNames.map { iconName in
            let texture = spriteframe.textureNamed(iconName)
            let image = UIImage(cgImage: texture.cgImage(), scale: 2.0, orientation: .up)
            return Icon(image: image)
        }
    }
}

private let iconNames: [String] = [
    "icon_002490_64",
    "icon_100690_64",
    "icon_101440_64",
    "icon_101570_64",
    "icon_109840_64",
    "icon_110290_64",
    "icon_111120_64",
    "icon_157740_64",
    "icon_159080_64",
    "icon_160260_64",
    "icon_161540_64",
    "icon_161620_64",
    "icon_162950_64",
    "icon_163001_64",
]
