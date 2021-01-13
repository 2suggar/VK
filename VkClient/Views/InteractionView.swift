//
//  InteractionView.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 29.10.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import UIKit

enum InteractionType {
    case comments
    case share
    case viewers
}

class InteractionView: UIControl {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    
    var count: Int? {
        didSet {
            countLabel.text = String(count ?? 0)
        }
    }
    
    var type: InteractionType? {
        didSet {
            switch type {
            case .comments:
                iconImageView.image = UIImage.init(systemName: "bubble.left")
                    
            case .share:
                iconImageView.image = UIImage.init(systemName: "arrowshape.turn.up.right")
                            
            case .viewers:
                iconImageView.image = UIImage.init(systemName: "eye")
            
            case .none:
                break
            }
            
            iconImageView.tintColor = .darkGray
        }
    }
}
