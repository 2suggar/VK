//
//  AvatarView.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 28.08.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import UIKit

class AvatarView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func draw(_ rect: CGRect) {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = frame.height / 2
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
    }

    @objc
    private func imageTapped() {
        UIView.animate(withDuration: 0.5,
        delay: 0,
        animations: {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: { _ in
            UIView.animate(withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0,
            options: [],
            animations: {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        })
    }
}
