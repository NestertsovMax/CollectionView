//
//  DefaultCollectionViewDelegate.swift
//  CollectionView
//
//  Created by M1 on 24.08.2022.
//

import UIKit

protocol CollectionViewSelectableItemDelegate: AnyObject, UICollectionViewDelegateFlowLayout {
    var didSelectedItem: ((_ indexPath: IndexPath) -> Void)? { get set }
}

class DefaultCollectionViewDelegate: NSObject, CollectionViewSelectableItemDelegate {
    var didSelectedItem: ((_ indexPath: IndexPath) -> Void)?
    
    var minimumItemSpacing: CGFloat { return 4 }
    var sectionInsets: UIEdgeInsets { return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20) }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumItemSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.purple
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.lightGray
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectedItem?(indexPath)
    }
}
