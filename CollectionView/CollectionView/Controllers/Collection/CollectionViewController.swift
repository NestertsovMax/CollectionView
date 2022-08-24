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

    @IBAction private func listButtonPressed(_ sender: Any) {
        
    }    
    @IBAction private func gribButtonPressed(_ sender: Any) {
        
    }
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? DetailsViewController else { return }
        destVC.fish = sender as? Fish
    }

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
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = .purple
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = .lightGray
    }
    
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderID", for: indexPath)
//        return header
//    }
    
}
