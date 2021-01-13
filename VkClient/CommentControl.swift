//
//  CommentControl.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 09.10.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import UIKit

class CommentsControl: UIControl {

    @IBOutlet weak var commentsLabel: UILabel!
    
    var countComments: Int = 0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        commentsLabel.text = String(countComments)
        addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(commentsTapped))
        )
        
    }
    
    @objc func commentsTapped() {
    }
}
