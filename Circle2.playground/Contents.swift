//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let width:CGFloat = 100
let height:CGFloat = 100

let view:UIView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
view.backgroundColor = UIColor.whiteColor()
XCPShowView("view", view: view)


// properties

let lineWidth:CGFloat = 3
let fillColor = UIColor.orangeColor()
let fill2Color = UIColor.redColor()
let duration = 1.5


// layer

// layer
let rootLayer = CALayer()
rootLayer.frame = CGRect(origin: CGPointZero, size: view.frame.size)

let circleWidth:CGFloat = min(view.bounds.size.width, view.bounds.size.height) / 4
let circleSize = CGSize(width: circleWidth, height: circleWidth)
let point1 = CGPoint(x: circleWidth / 2 + 10, y: view.bounds.midY - circleWidth / 2)
let point2 = CGPoint(x: view.frame.size.width - circleWidth / 2 - 10, y: view.bounds.midY - circleWidth / 2)

let circle1 = CAShapeLayer()
circle1.frame = CGRect(origin: point1, size: circleSize)
circle1.path = UIBezierPath(ovalInRect: CGRect(origin: CGPointZero, size: circleSize)).CGPath
circle1.fillColor = fillColor.CGColor
rootLayer.addSublayer(circle1)

let circle2 = CAShapeLayer()
circle2.frame = CGRect(origin: point1, size: circleSize)
circle2.path = UIBezierPath(ovalInRect: CGRect(origin: CGPointZero, size: circleSize)).CGPath
circle2.fillColor = fill2Color.CGColor
rootLayer.addSublayer(circle2)

view.layer.addSublayer(rootLayer)


//animation

CATransaction.begin()

let group = CAAnimationGroup()

let ani1 = CAKeyframeAnimation(keyPath:"position.x")
ani1.values = [point1.x, point2.x, point1.x]

let ani2 = CAKeyframeAnimation(keyPath: "zPosition")
ani2.values = [10, -10]
ani2.keyTimes = [0.0, 1.0]

let ani3 = CAKeyframeAnimation(keyPath: "transform.scale")
ani3.values = [1.0, 1.2, 1.4, 1.2, 1.0, 0.8, 0.6, 0.8, 1.0]

group.animations = [ani1, ani2, ani3]
group.duration = duration
group.repeatCount = Float.infinity
group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
circle1.addAnimation(group, forKey: nil)

let group2 = CAAnimationGroup()
let ani2_1 = CAKeyframeAnimation(keyPath:"position.x")
ani2_1.values = [point2.x, point1.x, point2.x]

let ani2_2 = CAKeyframeAnimation(keyPath: "zPosition")
ani2_2.values = [-10, 10]

let ani2_3 = CAKeyframeAnimation(keyPath: "transform.scale")
ani2_3.values = [1.0, 0.8, 0.6, 0.8, 1.0, 1.2, 1.4, 1.2, 1.0]

group2.animations = [ani2_1, ani2_2, ani2_3]
group2.duration = duration
group2.repeatCount = Float.infinity
group2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
circle2.addAnimation(group2, forKey: nil)

CATransaction.commit()
