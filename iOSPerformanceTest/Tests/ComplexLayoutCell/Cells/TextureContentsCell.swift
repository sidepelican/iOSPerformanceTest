import UIKit
import AsyncDisplayKit

final class TextureContentsCell: ASCellNode, ASTableDataSource {
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

        tableNode.dataSource = self
        addSubnode(tableNode)
    }

    override func didLoad() {
        super.didLoad()

        backgroundColor = .white
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        imageNode.style.maxSize = CGSize(width: constrainedSize.max.width / 2, height: 40)
        tableNode.style.minSize = CGSize(width: 200, height: 40)
        let imageLayout = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .spaceBetween,
            alignItems: .stretch,
            children: [ASRatioLayoutSpec(ratio: 1.0, child: imageNode) , tableNode]
        )

        let textLayout = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .start,
            alignItems: .start,
            children: [imageLayout, titleLabel, descriptionLabel]
        )
        textLayout.style.flexShrink = 1.0
        textLayout.style.flexGrow = 1.0

        return textLayout
    }

    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 1
    }

    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let bounds = tableNode.bounds
        return {
            let cell = ASCellNode()
            cell.backgroundColor = UIColor.random()
            cell.style.preferredSize = CGSize(width: bounds.width, height: 10)
            return cell
        }
    }
}
