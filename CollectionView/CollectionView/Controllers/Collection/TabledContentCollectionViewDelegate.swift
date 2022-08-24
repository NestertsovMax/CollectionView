//
//  TabledContentCollectionViewDelegate.swift
//  CollectionView
//
//  Created by M1 on 24.08.2022.
//

import UIKit

class TabledContentCollectionViewDelegate: DefaultCollectionViewDelegate {
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let paddindSectionSpace = sectionInsets.left + sectionInsets.right
            let widhPerItem = collectionView.bounds.width - paddindSectionSpace
            return CGSize(width: widhPerItem, height: widhPerItem * 0.5)
        }
}

