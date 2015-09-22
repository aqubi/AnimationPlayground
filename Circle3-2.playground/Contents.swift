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
let fillColor1 = UIColor(hue: 0.1, saturation: 1.0, brightness: 1.0, alpha: 1.0)
let fillColor2 = UIColor(hue: 0.1, saturation: 1.0, brightness: 1.0, alpha: 0.6)
let fillColor3 = UIColor(hue: 0.1, saturation: 1.0, brightness: 1.0, alpha: 0.4)
let duration = 0.7


// layer
let rootLayer = CALayer()
rootLayer.frame = CGRect(origin: CGPointZero, size: view.frame.size)

let circleWidth:CGFloat = view.bounds.size.width / 4
let circleSize = CGSize(width: circleWidth, height: circleWidth)

let circleRect = CGRect(x: (view.frame.midX - circleWidth / 2), y: (view.frame.midY - circleWidth / 2), width: circleWidth, height: circleWidth)

let circle1 = CAShapeLayer()
let circle1Point = CGPoint(x: 0, y: 0)
circle1.frame = CGRect(origin: circle1Point, size: circleSize)
circle1.path = UIBezierPath(ovalInRect: CGRect(origin: CGPointZero, size: circleRect.size)).CGPath
circle1.fillColor = fillColor1.CGColor
rootLayer.addSublayer(circle1)

let circle2 = CAShapeLayer()
let circle2Point = CGPoint(x: (view.bounds.size.width - circleWidth) / 2, y: 0)
circle2.frame = CGRect(origin: circle2Point, size: circleSize)
circle2.path = UIBezierPath(ovalInRect: CGRect(origin: CGPointZero, size: circleRect.size)).CGPath
circle2.fillColor = fillColor2.CGColor
rootLayer.addSublayer(circle2)

let circle3 = CAShapeLayer()
let circle3Point = CGPoint(x: view.bounds.size.width - circleWidth, y: 0)
circle3.frame = CGRect(origin: circle3Point, size: circleSize)
circle3.path = UIBezierPath(ovalInRect: CGRect(origin: CGPointZero, size: circleRect.size)).CGPath
circle3.fillColor = fillColor3.CGColor
rootLayer.addSublayer(circle3)

view.layer.addSublayer(rootLayer)

//animation

CATransaction.begin()

let ani1 = CAKeyframeAnimation(keyPath:"transform.scale.y")
ani1.values = [1, 1, 0.7]
ani1.keyTimes = [0.0, 0.85, 1.0]

let ani2 = CAKeyframeAnimation(keyPath:"transform.scale.x")
ani2.values = [1, 1, 1.4]
ani2.keyTimes = [0.0, 0.9, 1.0]

let ani3 = CABasicAnimation(keyPath: "transform.translation.y")
ani3.toValue = view.frame.size.height - circleWidth / 2

let group1 = CAAnimationGroup()
group1.animations = [ani1, ani2, ani3]
group1.duration = duration
group1.autoreverses = true
group1.repeatCount = Float.infinity
group1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
circle1.addAnimation(group1, forKey: nil)

let group2 = CAAnimationGroup()
group2.animations = [ani1, ani2, ani3]
group2.duration = duration
group2.autoreverses = true
group2.repeatCount = Float.infinity
group2.beginTime = CACurrentMediaTime() + (duration / 3)
group2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
circle2.addAnimation(group2, forKey: nil)

let group3 = CAAnimationGroup()
group3.animations = [ani1, ani2, ani3]
group3.duration = duration
group3.autoreverses = true
group3.repeatCount = Float.infinity
group3.beginTime = CACurrentMediaTime() + (duration / 3 * 2)
group3.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
circle3.addAnimation(group3, forKey: nil)

CATransaction.commit()
