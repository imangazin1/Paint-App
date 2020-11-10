//
//  Rectangle.swift
//  Drawing
//
//  Created by Магжан Имангазин on 9/29/20.
//  Copyright © 2020 Магжан Имангазин. All rights reserved.
//

import Foundation
import UIKit

class Rectangle {
    private var p1: CGPoint
    private var p2: CGPoint
    private var p3: CGPoint
    private var p4: CGPoint
    private var color: UIColor
    private var stroke_width: CGFloat
    private var isFilled: Bool
    var lines = [[CGPoint]]()
    
    init(p1: CGPoint, p2: CGPoint, p3: CGPoint, p4: CGPoint, color: UIColor, stroke_width: CGFloat, isFilled: Bool) {
        self.color = color
        self.isFilled = isFilled
        self.p1 = p1
        self.p2 = p2
        self.p3 = p3
        self.p4 = p4
        self.stroke_width = stroke_width
        let points = [p1, p2]
        lines.append(points)
    }
    
    func drawPath(lines:[CGRect]) {
        
        lines.forEach { (rect) in
            let path = UIBezierPath(rect: rect)
            path.lineWidth = stroke_width
            color.set()
            (isFilled) ? (path.fill()) : (path.stroke())
        }
    }
}
