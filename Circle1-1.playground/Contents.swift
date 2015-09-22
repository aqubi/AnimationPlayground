//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let width:CGFloat = 100
let height:CGFloat = 100

let view:UIView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
view.backgroundColor = UIColor.whiteColor()
XCPShowView("view", view: view)


let circle = CAShapeLayer()
circle.frame = CGRect(origin: CGPointZero, size: view.bounds.size)
circle.path = UIBezierPath(ovalInRect: circle.bounds).CGPath
circle.fillColor = UIColor.orangeColor().CGColor
view.layer.addSublayer(circle)

CATransaction.begin()
let animationGroup = CAAnimationGroup()

let ani1 = CABasicAnimation(keyPath:"transform.scale")
ani1.fromValue = 1.0
ani1.toValue = 0.4

let ani2 = CABasicAnimation(keyPath: "opacity")
ani2.fromValue = 1.0
ani2.toValue = 0.2

animationGroup.animations = [ani1, ani2]
animationGroup.duration = 1.5
animationGroup.autoreverses = true
animationGroup.repeatCount = Float.infinity
animationGroup.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
circle.addAnimation(animationGroup, forKey:nil)

CATransaction.commit()


