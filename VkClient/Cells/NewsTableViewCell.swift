//
//  NewsTableViewCell.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 04.09.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var likeView: LikeControl!
    @IBOutlet weak var commentView: InteractionView!
    @IBOutlet weak var shareView: InteractionView!
    @IBOutlet weak var viewersView: InteractionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        commentView.type = .comments
        shareView.type = .share
        viewersView.type = .viewers
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
