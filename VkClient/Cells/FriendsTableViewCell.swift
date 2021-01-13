//
//  FriendsTableViewCell.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 05.08.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: AvatarView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var model: User? {
        didSet {
            if let urlString = model?.photo_100,
               let url = URL(string: urlString),
               let data = try? Data(contentsOf: url) {
                avatar.imageView.image = UIImage(data: data)
            }
            nameLabel.text = "\(model?.first_name ?? "") \(model?.last_name ?? "")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
