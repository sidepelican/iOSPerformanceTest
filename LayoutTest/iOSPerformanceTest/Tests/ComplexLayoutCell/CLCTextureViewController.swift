import UIKit
import AsyncDisplayKit

private let items = Content.makeContents()

class CLCTextureViewController: ASViewController<ASCollectionNode>, ASCollectionDelegate, ASCollectionDataSource {
    init() {
        super.init(node: ASCollectionNode(collectionViewLayout: UICollectionViewFlowLayout()))

        node.delegate = self
        node.dataSource = self

        node.backgroundColor = .black
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }

    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return {
            let content = items[indexPath.item]
            return TextureContentsCell(content: content)
        }
    }

    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        let ret: CGSize
        if indexPath.row == 0 {
            ret = CGSize(width: collectionNode.bounds.width * 0.67, height: 160)
        } else {
            ret = CGSize(width: collectionNode.bounds.width / 10 - 1, height: 70)
        }

        return ASSizeRange(min: ret, max: ret)
    }
}
