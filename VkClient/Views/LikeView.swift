//
//  LikeView.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 31.08.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import UIKit

class LikeView: UIView {

    var isLiked: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath()
        let multiplier = CGFloat(0.9)
        let xSide = frame.height >= frame.width * multiplier ? frame.width : frame.height / multiplier
        let ySide = xSide * multiplier
        let arcRadius = CGFloat(xSide / 4)
        
        path.lineWidth = 2.0
        
        path.addArc(withCenter: CGPoint(x: xSide * 0.3, y: ySide * 0.35), radius: arcRadius, startAngle: 2.35, endAngle: 5.49, clockwise: true)
        path.addLine(to: CGPoint(x: xSide/2, y: ySide * 0.2))
        path.addArc(withCenter: CGPoint(x: xSide * 0.7, y: ySide * 0.35), radius: arcRadius, startAngle: 3.93, endAngle: 0.78, clockwise: true)
        path.addLine(to: CGPoint(x: xSide * 0.5, y: ySide * 0.95))

        path.close()
        
        if (isLiked)
        {
            UIColor.red.setFill()
            path.fill()
            UIColor.red.setStroke()
            path.stroke()
        } else {
            UIColor.black.setStroke()
            path.stroke()
        }
    }

}
