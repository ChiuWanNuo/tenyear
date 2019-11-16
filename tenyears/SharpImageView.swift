//
//  SharpImageView.swift
//  tenyears
//
//  Created by ChiuWanNuo on 2019/11/14.
//  Copyright © 2019 ChiuWanNuo. All rights reserved.
//

import UIKit

class SharpImageView: UIImageView {
    
    override func layoutSubviews() {
       super.layoutSubviews()
       let path = UIBezierPath()
       path.move(to: CGPoint.zero)
       path.addLine(to: CGPoint(x: bounds.width, y: 0.5))
       path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
       path.addLine(to: CGPoint(x: 0, y: bounds.height * 0.8))
       path.close()
       let shapeLayer = CAShapeLayer()
       shapeLayer.path = path.cgPath
       layer.mask = shapeLayer
    }

}
