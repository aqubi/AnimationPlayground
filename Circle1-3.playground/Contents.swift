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
let duration = 0.8


// layer

let circleWidth:CGFloat = min(view.bounds.size.width, view.bounds.size.height) / 3
let circleRect = CGRect(x: (view.frame.midX - circleWidth / 2), y: 0, width: circleWidth, height: circleWidth)

let circle1 = CAShapeLayer()
circle1.frame = circleRect
circle1.path = UIBezierPath(ovalInRect: CGRect(origin: CGPointZero, size: circleRect.size)).CGPath
circle1.fillColor = fillColor.CGColor
circle1.contentsScale = UIScreen.mainScreen().scale
view.layer.addSublayer(circle1)

//animation

CATransaction.begin()

let group = CAAnimationGroup()

let ani1 = CAKeyframeAnimation(keyPath:"transform.scale.y")
ani1.values = [1, 1, 0.7]
ani1.keyTimes = [0.0, 0.85, 1.0]

let ani2 = CAKeyframeAnimation(keyPath:"transform.scale.x")
ani2.values = [1, 1, 1.4]
ani2.keyTimes = [0.0, 0.9, 1.0]

let ani3 = CABasicAnimation(keyPath: "transform.translation.y")
ani3.toValue = view.frame.size.height - circleWidth + 20

group.animations = [ani1, ani2, ani3]
group.duration = duration
group.autoreverses = true
group.repeatCount = Float.infinity
group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)

circle1.addAnimation(group, forKey: nil)

CATransaction.commit()
