//: Playground - noun: a place where people can play


import UIKit
import XCPlayground

let width:CGFloat = 100
let height:CGFloat = 100

let view:UIView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
view.backgroundColor = UIColor.whiteColor()
XCPShowView("view", view: view)


// properties

let lineWidth:CGFloat = 10
let lineColor = UIColor.orangeColor()
let duration = 1.5


// layer

let circle = CAShapeLayer()
let circleWidth:CGFloat = min(view.bounds.size.width, view.bounds.size.height)
circle.frame = CGRect(origin: CGPointZero, size: CGSize(width: circleWidth, height: circleWidth))
let arcCenter = CGPoint(x: circle.frame.midX, y: circle.frame.midY)
let radius = (circle.bounds.width - lineWidth) / 2
circle.path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: CGFloat(M_PI), endAngle: CGFloat(0), clockwise: true).CGPath

circle.lineWidth = lineWidth
circle.fillColor = UIColor.clearColor().CGColor
circle.strokeColor = lineColor.CGColor
circle.lineCap = kCALineCapRound

let gradient = CAGradientLayer()
gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
gradient.frame = circle.frame
gradient.colors = [UIColor(white: 1.0, alpha: 0).CGColor, lineColor.CGColor]
gradient.mask = circle
view.layer.addSublayer(gradient)


//animation

CATransaction.begin()

let ani1 = CABasicAnimation(keyPath:"transform.rotation")
ani1.fromValue = 0
ani1.toValue = M_PI * 2
ani1.duration = duration
ani1.repeatCount = Float.infinity
ani1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
gradient.addAnimation(ani1, forKey:nil)

CATransaction.commit()


