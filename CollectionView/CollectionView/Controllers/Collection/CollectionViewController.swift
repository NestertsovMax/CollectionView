//
//  CollectionViewController.swift
//  CollectionView
//
//  Created by M1 on 22.08.2022.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    private var datasource: [Fish] = []
    private let gridedDelegate = GriddedContentCollectionViewDelegate()
    private let tableDelegate = TabledContentCollectionViewDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateDatasource()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        gridedDelegate.didSelectedItem = { [unowned self] indexPath in
            self.showDetailsController(for: indexPath)
        }
        tableDelegate.didSelectedItem = { [unowned self] indexPath in
            self.showDetailsController(for: indexPath)
        }
        
        collectionView?.delegate = gridedDelegate
        collectionView?.register(FishCollectionViewCell.nib, forCellWithReuseIdentifier: FishCollectionViewCell.reuseId)
    }
    
    private func showDetailsController(for indexPath: IndexPath) {
        let fish = datasource[indexPath.item]
        performSegue(withIdentifier: "showDetailsViewController", sender: fish)
    }
    
    private func generateDatasource() {
        for i in 1...20 {
            let imageLiteralName = "\(i % 5 + 1)"
            let fish = Fish(name: "\(i)", image: UIImage(imageLiteralResourceName: imageLiteralName))
            datasource.append(fish)
        }
        collectionView?.reloadData()
    }

    @IBAction private func listButtonPressed(_ sender: Any) {
        collectionView?.delegate = tableDelegate
        collectionView?.performBatchUpdates({
            collectionView?.reloadData()
        }, completion: nil)
    }    
    @IBAction private func gribButtonPressed(_ sender: Any) {
        collectionView?.delegate = gridedDelegate
        collectionView?.performBatchUpdates({
            collectionView?.reloadData()
        }, completion: nil)
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
        1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        datasource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FishCollectionViewCell.reuseId, for: indexPath) as? FishCollectionViewCell else {
            fatalError("Cell doesn't exist")
        }
        let fish = datasource[indexPath.item]
        cell.update(name: fish.name, image: fish.image)
        return cell
    }
}
