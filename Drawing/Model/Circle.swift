//
//  Circle.swift
//  Drawing
//
//  Created by Магжан Имангазин on 9/29/20.
//  Copyright © 2020 Магжан Имангазин. All rights reserved.
//

import Foundation
import UIKit

class Circle: Drawable {
    func drawPath() {
        <#code#>
    }
    
    private var radius: CGFloat
    private var circle_center: CGPoint
    private var color: UIColor
    private var stroke_width: CGFloat
    private var isFilled: Bool
    
    
    init(with radius: CGFloat, and circle_center: CGPoint, withSome color: UIColor, and stroke_width: CGFloat, isFilled: Bool) {
        self.circle_center = circle_center
        self.color = color
        self.radius = radius
        self.isFilled = isFilled
        self.stroke_width = stroke_width
    }
    
    func drawPath(bezierArray:[UIBezierPath]) {
        bezierArray.forEach { (path) in
            path.lineWidth = stroke_width
            color.set()
            (isFilled) ? (path.fill()) : (path.stroke())
        }
    }
}

extension Double {
    var cg: CGFloat {
        return CGFloat(self)
    }
}
