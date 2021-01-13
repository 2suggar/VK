//
//  PhotoCollectionViewCell.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 24.08.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import UIKit
import AVFoundation

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.contentMode = .scaleAspectFit
        clipsToBounds = true
    }
}

