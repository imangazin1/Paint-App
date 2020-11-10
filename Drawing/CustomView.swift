//
//  CustomView.swift
//  Drawing
//
//  Created by Магжан Имангазин on 9/29/20.
//  Copyright © 2020 Магжан Имангазин. All rights reserved.
//

import UIKit

class CustomView: UIView {
    var point1: CGPoint?
    var point2: CGPoint!
    
    var tags = 0
    var button = UIButton()
    var lines = [[CGPoint]]()
    var lines2 = [[CGPoint]]()
    var rects = [CGRect]()
    var circleArray = [UIBezierPath]()
    var isClean
        
        
        
        
        
        
        = false
    
    var circleBt: UIButton {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        return button
    };()
        
    var rectBt: UIButton {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        return button
    };()
    
    @IBAction func clearPressed(_ sender: UIButton) {
        isClean = true
        _ = lines.popLast()
        _ = lines2.popLast()
        _ = rects.popLast()
        _ = circleArray.popLast()
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        if let p1 = point1 {
            if tags == circleBt.tag {
                let circle = Circle(with: abs(point2.x - p1.x), and: p1, withSome: button.backgroundColor!, and: 4, isFilled: (FillSwitch.isOn) ? true : false)
                if !isClean {
                    let path = UIBezierPath(arcCenter: p1,
                    radius: abs(point2.x - p1.x),
                    startAngle: 0,
                    endAngle: 2 * Double.pi.cg,
                    clockwise: true)
                    circleArray.append(path)
                }
                circle.drawPath(bezierArray: circleArray)
            } else if tags == rectBt.tag {
                let rect = Rectangle.init(p1: p1, p2: point2, p3: CGPoint(x: p1.y, y: point2.x), p4: CGPoint(x: p1.x, y: point2.y), color: button.backgroundColor!, stroke_width: 4, isFilled: (FillSwitch.isOn) ? true : false)
                if !isClean {
                    let rect = CGRect(origin: p1, size: CGSize(width: abs(point2.x - p1.x), height: abs(point2.y - p1.y)))
                    rects.append(rect)
                }
                rect.drawPath(lines: rects)
                isClean = false
            } else if tags == lineBt.tag {
                let line1 = Line(p1: p1, p2: point2, color: button.backgroundColor!)
                if !isClean {
                    let points = [p1, point2]
                    lines2.append(points as! [CGPoint])
                }
                line1.drawPath(lines: lines2)
                isClean = false
            } else if tags == triangleBt.tag {
                let triangle = Triangle(p1: p1, p2: point2, p3: CGPoint(x: p1.x, y: point2.y), color: button.backgroundColor!, isFilled: (FillSwitch.isOn) ? true : false)
                if !isClean {
                    let points = [p1,point2,CGPoint(x: p1.x, y: point2.y)]
                    lines2.append(points as! [CGPoint])
                }
                triangle.drawPath(lines: lines2)
                isClean = false
            } else if tags == PenBt.tag {
                drawWithPen()
            }
        }
    }
    
    func drawWithPen() {
        let path = UIBezierPath()
        UIColor.black.set()
        path.lineWidth = 10

        lines.forEach { (line) in
            for (i, p) in line.enumerated() {
                if i == 0 {
                    path.move(to: p)
                } else {
                    path.addLine(to: p)
                }
            }
        }
        path.stroke()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            if let touch = touches.first {
                point1 = touch.location(in: self)
            }
            lines.append([CGPoint]())
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard let point = touches.first?.location(in: nil) else {return}
            guard var lastLine = lines.popLast() else { return }
            lastLine.append(point)
            lines.append(lastLine)
            point2 = lastLine.first
            if tags == PenBt.tag {
                setNeedsDisplay()
            }
        }
    
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            if let touch = touches.first {
                point2 = touch.location(in: self)
            }
            setNeedsDisplay()
        }
}
