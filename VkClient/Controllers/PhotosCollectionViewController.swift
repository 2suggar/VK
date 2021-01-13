//
//  PhotosCollectionViewController.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 23.08.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {

    var user: User? {
        didSet {
            self.title = user?.first_name
            NetworkService.shared.getPhotos(by: String(user?.id ?? 0)) { (photos) in
                self.photos = photos
            }
        }
    }
    
    private var photos: [Photo] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeToLeft))
        leftSwipe.direction = .left
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeToRight))
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }
    
    @objc
    func swipeToLeft() {
        if let visibleCell = collectionView.visibleCells.first,
           let indexPath = collectionView.indexPath(for: visibleCell),
           indexPath.row + 1 < collectionView.numberOfItems(inSection: indexPath.section)
        {
            let next = IndexPath(row: indexPath.row + 1, section: indexPath.section)
            collectionView.scrollToItem(at: next, at: .centeredHorizontally, animated: true)
        }
    }
    
    @objc
    func swipeToRight() {
        if let visibleCell = collectionView.visibleCells.first,
           let indexPath = collectionView.indexPath(for: visibleCell),
           indexPath.row > 0
        {
            let next = IndexPath(row: indexPath.row - 1, section: indexPath.section)
            collectionView.scrollToItem(at: next, at: .centeredHorizontally, animated: true)
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        if let urlString = self.photos[indexPath.row].sizes.last?.url,
            let url = URL(string: urlString),
            let data = try? Data(contentsOf: url) {
            cell.photoImageView.image = UIImage(data: data)
        }
        return cell
    }
}
