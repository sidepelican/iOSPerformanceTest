import UIKit
import AsyncDisplayKit

final class TextureContentsCell: ASCellNode {
    private let imageNode = ASImageNode()
    private let tableNode = ASTableNode()
    private let titleLabel = ASTextNode()
    private let descriptionLabel = ASTextNode()

    init(content: Content) {
        super.init()

        automaticallyManagesSubnodes = true

        imageNode.image = content.image
        imageNode.isLayerBacked = true

        titleLabel.attributedText = NSAttributedString(string: content.title, attributes: [
                .font: UIFont.systemFont(ofSize: 19, weight: .bold)
            ])
        titleLabel.maximumNumberOfLines = 1
        titleLabel.isLayerBacked = true

        descriptionLabel.attributedText = NSAttributedString(string: content.description)
        descriptionLabel.maximumNumberOfLines = 0
        descriptionLabel.isLayerBacked = true
    }

    override func didLoad() {
        super.didLoad()

        backgroundColor = .white
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        imageNode.style.maxWidth = ASDimension(unit: .auto, value: constrainedSize.max.width / 2)
        imageNode.style.maxHeight = ASDimension(unit: .auto, value: constrainedSize.max.width / 2)

        let textLayout = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .start,
            alignItems: .baselineFirst,
            children: [imageNode, titleLabel, descriptionLabel]
        )
        textLayout.style.flexShrink = 1.0
        textLayout.style.flexGrow = 1.0

        return textLayout
    }
}
