//
//  Triangle.swift
//  Drawing
//
//  Created by Магжан Имангазин on 9/30/20.
//  Copyright © 2020 Магжан Имангазин. All rights reserved.
//

import Foundation
import UIKit

class Triangle {
    private var p1: CGPoint
    private var p2: CGPoint
    private var p3: CGPoint
    private var color: UIColor
    private var isFilled: Bool
    var lines = [[CGPoint]]()
    init(p1: CGPoint, p2: CGPoint, p3: CGPoint, color: UIColor, isFilled: Bool) {
        self.p1 = p1
        self.p2 = p2
        self.p3 = p3
        self.color = color
        self.isFilled = isFilled
        let points = [p1,p2,p3]
        lines.append(points)
    }
    
    func drawPath(lines:[[CGPoint]]) {
        let path = UIBezierPath()
        lines.forEach { (line) in
        for (i, p) in line.enumerated() {
                if i == 0 {
                    path.move(to: p)
                } else {
                    path.addLine(to: p)
                }
            }
        }
        color.set()
        path.lineWidth = 4
        path.close()
        (isFilled) ? (path.fill()) : (path.stroke())
    }
}
