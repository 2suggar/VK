//
//  LikeControl.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 28.08.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import UIKit

class LikeControl: UIControl {

    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var likeView: LikeView!
    
    var countLikes: Int = 0
    
    var isLiked: Bool = false
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        )
        likesLabel.text = String(countLikes)
        
    }
    
    @objc func likeTapped() {
        isLiked.toggle()
        countLikes += isLiked ? 1 : -1
        likesLabel.text = String(countLikes)
        likeView.isLiked = isLiked
    }

}
