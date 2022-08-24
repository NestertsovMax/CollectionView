//
//  DefaultCollectionViewDelegate.swift
//  CollectionView
//
//  Created by M1 on 24.08.2022.
//

import UIKit

class DefaultCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {
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
}
