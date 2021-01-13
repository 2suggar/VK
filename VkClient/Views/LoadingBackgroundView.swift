//
//  LoadingBackgroundView.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 15.10.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import UIKit

class LoadingBackgroundView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath()
        let radius = frame.width / 5
        
        path.addArc(
            withCenter: CGPoint(x: radius, y: radius),
            radius: radius,
            startAngle: .pi * 7 / 4,
            endAngle: .pi / 4,
            clockwise: true
        )
        path.addArc(
            withCenter: CGPoint(x: frame.width / 2, y: radius),
            radius: radius,
            startAngle: .pi * 3 / 4,
            endAngle: .pi / 4,
            clockwise: true
        )
        path.addArc(
            withCenter: CGPoint(x: frame.width * 4 / 5, y: radius),
            radius: radius,
            startAngle: .pi * 3 / 4,
            endAngle: .pi * 5 / 4,
            clockwise: true
        )
        path.addArc(
            withCenter: CGPoint(x: frame.width / 2, y: radius),
            radius: radius,
            startAngle: .pi * 7 / 4,
            endAngle: .pi * 5 / 4,
            clockwise: true
        )
        
        path.close()
        UIColor.red.setFill()
        path.fill()
        
//        layer.shadowOffset = CGSize(width: 10, height: 10)
    }
}
