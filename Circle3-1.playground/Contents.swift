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
let duration = 0.7


// layer
let rootLayer = CALayer()
rootLayer.frame = CGRect(origin: CGPointZero, size: view.frame.size)

let circleWidth:CGFloat = min(view.bounds.size.width, view.bounds.size.height) / 3
let circleRect = CGRect(x: (view.frame.midX - circleWidth / 2), y: (view.frame.midY - circleWidth / 2), width: circleWidth, height: circleWidth)

let circle1 = CAShapeLayer()
circle1.frame = circleRect
circle1.path = UIBezierPath(ovalInRect: CGRect(origin: CGPointZero, size: circleRect.size)).CGPath
circle1.fillColor = fillColor.CGColor
rootLayer.addSublayer(circle1)

let circle2 = CAShapeLayer()
circle2.frame = circleRect
circle2.path = UIBezierPath(ovalInRect: CGRect(origin: CGPointZero, size: circleRect.size)).CGPath
circle2.fillColor = fillColor.CGColor
rootLayer.addSublayer(circle2)

let circle3 = CAShapeLayer()
circle3.frame = circleRect
circle3.path = UIBezierPath(ovalInRect: CGRect(origin: CGPointZero, size: circleRect.size)).CGPath
circle3.fillColor = fillColor.CGColor
rootLayer.addSublayer(circle3)

view.layer.addSublayer(rootLayer)

//animation

CATransaction.begin()

let ani1 = CABasicAnimation(keyPath:"position.y")
ani1.toValue = circleWidth / 2
ani1.duration = duration
ani1.autoreverses = true
ani1.repeatCount = Float.infinity
ani1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
circle1.addAnimation(ani1, forKey: nil)

let ani2 = CABasicAnimation(keyPath:"position")
ani2.toValue = NSValue(CGPoint:CGPoint(x: circleWidth / 2, y: view.frame.size.height - circleWidth / 2))
ani2.duration = duration
ani2.autoreverses = true
ani2.repeatCount = Float.infinity
ani2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
circle2.addAnimation(ani2, forKey: nil)

let ani3 = CABasicAnimation(keyPath:"position")
ani3.toValue = NSValue(CGPoint:CGPoint(x: view.frame.size.width - circleWidth / 2, y: view.frame.size.height - circleWidth / 2))
ani3.duration = duration
ani3.autoreverses = true
ani3.repeatCount = Float.infinity
ani3.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
circle3.addAnimation(ani3, forKey: nil)

//let ani4 = CABasicAnimation(keyPath:"transform.rotation")
//ani4.fromValue = 0
//ani4.toValue = M_PI * 2
//ani4.duration = duration
//ani4.repeatCount = Float.infinity
//ani4.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
//rootLayer.addAnimation(ani4, forKey:nil)

CATransaction.commit()
