//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let width:CGFloat = 150
let height:CGFloat = 100

let view:UIView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
view.backgroundColor = UIColor.whiteColor()
XCPShowView("view", view: view)


// properties

let lineWidth:CGFloat = 3

let fillColor = UIColor(hue: 0.6, saturation: 0.8, brightness: 0.7, alpha: 1.0)
let count = 5
let squareWidth:CGFloat = view.bounds.size.width / CGFloat(count + 1)
let duration = 1.5


// layer
let rootLayer = CALayer()
rootLayer.frame = CGRect(origin: CGPointZero, size: view.frame.size)


let squareSize = CGSize(width: squareWidth, height: squareWidth)
let y = (rootLayer.frame.size.height - squareWidth) / 2

var squares:[CAShapeLayer] = []
var x:CGFloat = 0
var opacity:Float = 1.0

for var i = 0; i < count; i++ {
    let square = CAShapeLayer()
    square.frame = CGRect(origin: CGPoint(x: x, y: y), size: squareSize)
    square.fillColor = fillColor.CGColor
    square.path = UIBezierPath(rect: CGRect(origin: CGPointZero, size: squareSize)).CGPath
    square.opacity = opacity
    rootLayer.addSublayer(square)
    squares.append(square)
    x += squareWidth + 5
    opacity = 0.1
}

view.layer.addSublayer(rootLayer)

//animation

CATransaction.begin()
var delay:Double = 0

for square in squares {
    let ani = CAKeyframeAnimation(keyPath: "opacity")
    ani.values = [0.1, 1.0, 0.1, 0.1]
    ani.keyTimes = [0.0, 0.2, 0.6, 1.0]
    ani.repeatCount = Float.infinity
    ani.duration = duration
    ani.beginTime = CACurrentMediaTime() + delay
    square.addAnimation(ani, forKey: nil)
    delay += duration / Double(count)
}

CATransaction.commit()
