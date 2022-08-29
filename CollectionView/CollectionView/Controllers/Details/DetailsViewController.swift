//
//  DetailsViewController.swift
//  CollectionView
//
//  Created by M1 on 22.08.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var fish: Fish?

    @IBOutlet private weak var ibImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = fish?.name
        ibImageView.image = fish?.image
    }
}
