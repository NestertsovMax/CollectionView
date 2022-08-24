//
//  GriddedContentCollectionViewDelegate.swift
//  CollectionView
//
//  Created by M1 on 24.08.2022.
//

import UIKit

class GriddedContentCollectionViewDelegate: DefaultCollectionViewDelegate {
    override var minimumItemSpacing: CGFloat { return 4 }
    override var sectionInsets: UIEdgeInsets { return UIEdgeInsets(top: 20, left: 12, bottom: 30, right: 12) }
    private let itemPerRow: CGFloat = 3
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let itemSize: CGSize
            let paddindSectionSpace = sectionInsets.left + sectionInsets.right
            if indexPath.item % Int(itemPerRow + 1) == 0 {
                let itemWidth = collectionView.bounds.width - paddindSectionSpace
                itemSize = CGSize(width: itemWidth, height: itemWidth * 0.4)
            } else {
                let paddingSpace = paddindSectionSpace + minimumItemSpacing * (itemPerRow - 1)
                let avalibaleWidth = collectionView.bounds.width - paddingSpace
                let widhPerItem = avalibaleWidth / itemPerRow - 1
                itemSize = CGSize(width: widhPerItem, height: widhPerItem)
            }
            return itemSize
        }
}
