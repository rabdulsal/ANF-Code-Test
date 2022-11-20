//
//  ANFProductCellHeightCalculator.swift
//  ANF Code Test
//
//  Created by Rashad Abdul-Salam on 11/21/22.
//

import Foundation
import UIKit

/// Object for calculating dynamic cell height of ANFProductCell
final class ANFProductCellHeightCalculator {
    
    static func GetHeightForTableViewCell(_ tableView: UITableView, with product: ANFProductItem, for indexPath: IndexPath) -> CGFloat {
        var cachedHeight = [IndexPath : CGFloat]()

        let defaultHeight : CGFloat = 400
        if let height = cachedHeight[indexPath]{
            return height
        }

        let cache = ANFImageProviderService.ImageCache

        guard let url = URL(string:product.backgroundImage) as? NSURL else {
            return defaultHeight
        }
        let image : UIImage? = cache.object(forKey: url)

        if let image = image {
            let textContentHeight = 225.0
            let baseHeight : CGFloat = CGFloat(defaultHeight - textContentHeight)
            let imageWidth = tableView.frame.size.width
            let imageHeight = image.size.height * imageWidth / image.size.width

            cachedHeight[indexPath] = imageHeight + baseHeight
            return cachedHeight[indexPath]!
        }

        return defaultHeight
    }
}
