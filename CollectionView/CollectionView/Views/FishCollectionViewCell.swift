//
//  FishCollectionViewCell.swift
//  CollectionView
//
//  Created by M1 on 22.08.2022.
//

import UIKit

class FishCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = String(describing:FishCollectionViewCell.self)
    static let nib = UINib(nibName: String(describing:FishCollectionViewCell.self), bundle: nil)

    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var ibTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(name: String, image: UIImage) {
        ibTitle.text = name
        imageView.image = image
    }

}
