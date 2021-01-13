//
//  GroupTableViewCell.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 23.08.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var model: Group? {
        didSet {
            if let urlString = model?.photo_100,
               let url = URL(string: urlString),
               let data = try? Data(contentsOf: url) {
                photoImageView.image = UIImage(data: data)
            }
            nameLabel.text = model?.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.layer.cornerRadius = photoImageView.bounds.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
