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
let lineColor = UIColor.orangeColor()
let duration = 1.8
let text = "LOADING"
let textFont = UIFont.boldSystemFontOfSize(13)


// layer

let circleWidth:CGFloat = min(view.bounds.size.width, view.bounds.size.height)
let circleRect = CGRect(origin: CGPointZero, size: CGSize(width: circleWidth, height: circleWidth))
let arcCenter = CGPoint(x: circleRect.midX, y: circleRect.midY)
let radius = (circleRect.width - lineWidth) / 2
let diff = 0.6

let rootLayer = CALayer()
rootLayer.frame = circleRect

let arc1 = CAShapeLayer()
arc1.frame = circleRect
arc1.path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: CGFloat(M_PI), endAngle: CGFloat(M_PI_2), clockwise: true).CGPath
arc1.lineWidth = lineWidth
arc1.fillColor = UIColor.clearColor().CGColor
arc1.strokeColor = lineColor.CGColor
arc1.lineCap = kCALineCapRound
rootLayer.addSublayer(arc1)

let arc2 = CAShapeLayer()
let arc2Width = circleWidth - 20
let arc2Rect = CGRect(origin: CGPoint(x: (view.bounds.size.width - arc2Width) / 2, y: (view.bounds.size.height - arc2Width) / 2), size: CGSize(width: arc2Width, height: arc2Width))
let arc2LineWidth = lineWidth * 0.5
let arc2Radius = (arc2Rect.width - arc2LineWidth) / 2
arc2.frame = arc2Rect
arc2.path = UIBezierPath(arcCenter:  CGPoint(x: arc2Rect.size.width / 2, y: arc2Rect.size.width / 2), radius: arc2Radius, startAngle: CGFloat(M_PI_4), endAngle: CGFloat(M_PI), clockwise: false).CGPath
arc2.lineWidth = arc2LineWidth
arc2.fillColor = UIColor.clearColor().CGColor
arc2.strokeColor = lineColor.CGColor
arc2.lineCap = kCALineCapRound
rootLayer.addSublayer(arc2)

let textsize = NSString(string: text).sizeWithAttributes([NSFontAttributeName : textFont])
let textLayer = CATextLayer()
textLayer.frame = CGRect(x: 0, y: (circleRect.size.height - textsize.height) / 2, width: circleRect.size.width, height: textsize.height)
textLayer.foregroundColor = lineColor.CGColor
textLayer.font = textFont
textLayer.fontSize = textFont.pointSize
textLayer.string = text
textLayer.alignmentMode = kCAAlignmentCenter

view.layer.addSublayer(textLayer)
view.layer.addSublayer(rootLayer)


//animation

CATransaction.begin()

let ani1 = CABasicAnimation(keyPath:"transform.rotation")
ani1.fromValue = 0
ani1.toValue = M_PI * 2
ani1.duration = duration
ani1.repeatCount = Float.infinity
ani1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
arc1.addAnimation(ani1, forKey:nil)

let ani2 = CABasicAnimation(keyPath:"transform.rotation")
ani2.fromValue = M_PI * 2
ani2.toValue = 0
ani2.duration = duration
ani2.repeatCount = Float.infinity
ani2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
arc2.addAnimation(ani2, forKey:nil)

CATransaction.commit()
