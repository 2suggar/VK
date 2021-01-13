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
