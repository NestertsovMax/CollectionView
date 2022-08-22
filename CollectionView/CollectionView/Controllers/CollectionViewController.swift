//
//  CollectionViewController.swift
//  CollectionView
//
//  Created by M1 on 22.08.2022.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    private var datasource: [Fish] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateDatasource()
        collectionView.register(FishCollectionViewCell.nib, forCellWithReuseIdentifier: FishCollectionViewCell.reuseId)
    }
    
    private func generateDatasource() {
        for i in 1...20 {
            let imageLiteralName = "\(i % 5 + 1)"
            let fish = Fish(name: "\(i)", image: UIImage(imageLiteralResourceName: imageLiteralName))
            datasource.append(fish)
        }
        collectionView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    



//

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

// MARK: - UICollectionViewDataSource & UICollectionViewDelegate

extension CollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FishCollectionViewCell.reuseId, for: indexPath) as? FishCollectionViewCell else {
            fatalError("Cell doesn't exist")
        }
        let fish = datasource[indexPath.item]
        cell.update(name: fish.name, image: fish.image)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fish = datasource[indexPath.item]
        performSegue(withIdentifier: "showDetailsViewController", sender: fish)
        
    }
    
}
