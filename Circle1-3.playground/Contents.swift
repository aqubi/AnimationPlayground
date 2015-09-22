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
let duration = 0.5


// layer

let circleWidth:CGFloat = min(view.bounds.size.width, view.bounds.size.height) / 3
let circleRect = CGRect(x: (view.frame.midX - circleWidth / 2), y: 10, width: circleWidth, height: circleWidth)

let circle1 = CAShapeLayer()
circle1.frame = circleRect
circle1.path = UIBezierPath(ovalInRect: CGRect(origin: CGPointZero, size: circleRect.size)).CGPath
circle1.fillColor = fillColor.CGColor
view.layer.addSublayer(circle1)


//animation

CATransaction.begin()

let group = CAAnimationGroup()

let ani1 = CAKeyframeAnimation(keyPath:"transform.rotation.x")
ani1.values = [M_PI / 5, 0]
ani1.keyTimes = [0.99, 0.01]

let ani2 = CABasicAnimation(keyPath: "transform.translation.y")
ani2.toValue = view.frame.size.height - circleWidth  - 10

group.animations = [ani1, ani2]
group.duration = duration
group.autoreverses = true
group.repeatCount = Float.infinity
group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)

circle1.addAnimation(group, forKey: nil)

CATransaction.commit()
