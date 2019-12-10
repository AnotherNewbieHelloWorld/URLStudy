//
//  MainCollectionViewController.swift
//  URLStudy
//
//  Created by Apple User on 10.12.2019.
//  Copyright © 2019 Alena Khoroshilova. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MainViewController: UICollectionViewController {
    
    let actions = ["Download Image", "GET", "POST", "Our Courses", "Uplload Image"]
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        cell.label.text = actions[indexPath.row]
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    

}
