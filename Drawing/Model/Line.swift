//
//  Line.swift
//  Drawing
//
//  Created by Магжан Имангазин on 9/30/20.
//  Copyright © 2020 Магжан Имангазин. All rights reserved.
//

import Foundation
import UIKit

class Line {
    
//    private var p1: CGPoint
//    private var p2: CGPoint
//    
//    init(p1: CGPoint, p2: CGPoint) {
//        self.p1 = p1
//        self.p2 = p2
//    }
    
    func drawPath() {
        
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(UIColor.red.cgColor)
        context.setLineWidth(10)
        context.setLineCap(.butt)

        
        

        context.strokePath()
    }
    
    
}
