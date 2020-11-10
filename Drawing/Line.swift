//
//  Line.swift
//  Drawing
//
//  Created by Магжан Имангазин on 10/1/20.
//  Copyright © 2020 Магжан Имангазин. All rights reserved.
//

import Foundation
import UIKit

class Line {
    private var p1: CGPoint
    private var p2: CGPoint
    private var color: UIColor
    var lines = [[CGPoint]]()
    
    init(p1: CGPoint, p2: CGPoint, color: UIColor) {
        self.p1 = p1
        self.p2 = p2
        self.color = color
        let points = [p1, p2]
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
        path.close()
        color.set()
        path.lineWidth = 4
        path.stroke()
    }
}
