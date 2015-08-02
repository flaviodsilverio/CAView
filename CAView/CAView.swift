//
//  CAView.swift
//  CAView
//
//  Created by Flávio Silvério
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

class CAView: UIView {
        
        enum StartingPoint{
            
            case Top
            case Right
            case Bottom
            case Left
            
        }
        
        var startingPoint : StartingPoint = StartingPoint.Top
        
        private var backgroundCircle : CAShapeLayer = CAShapeLayer()
        private let animatedCircle   : CAShapeLayer = CAShapeLayer()
        
        internal var backgroundCircleColor : UIColor = UIColor.grayColor()
        internal var fillColor : UIColor = UIColor.blueColor()
        
        internal var clockwise : Bool = Bool(true)
        internal var percentage : CGFloat = 1.0
        private  var auxNumber : CGFloat = 0
        
        private var label : UILabel = UILabel()
        private var timer : NSTimer = NSTimer()
        private var userText : Bool = Bool(false)
        
        override init(frame: CGRect){
            
            super.init(frame: frame)
            
            self.backgroundColor = UIColor.clearColor()
            self.layer.cornerRadius = self.frame.height / 2
            self.clipsToBounds = true
            
            configureTextLabel("100%")
        }
        
        
        init(frame: CGRect, backGroundColor: UIColor, text: String, andFillColor: UIColor) {
            
            super.init(frame: frame)
            
            self.backgroundColor = UIColor.clearColor()
            self.layer.cornerRadius = self.frame.height / 2
            self.clipsToBounds = true
            
            self.backgroundCircleColor = backGroundColor
            self.fillColor = andFillColor;
            
            if count(text) > 0 {
                
                self.userText = true
                configureTextLabel(text)
                
            } else {
                
                configureTextLabel("100%")
                
            }
            
        }
        
        func configureTextLabel(string: String){
            
            label = UILabel(
                frame: CGRectMake(0, 0, (self.frame.width * 1.35)/2,
                    (self.frame.height * 0.9)/2))
            
            label.center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
            label.textColor = UIColor.blackColor()
            label.textAlignment = NSTextAlignment.Center
            label.textColor = fillColor;
            self.addSubview(label)
            
            var originalString: String = string
            var fontSize : CGFloat = CGFloat(100)
            let myString: NSString = originalString as NSString
            var size: CGSize = myString.sizeWithAttributes([NSFontAttributeName: UIFont.systemFontOfSize(fontSize)])
            
            while(size.width > label.frame.width){
                size = myString.sizeWithAttributes([NSFontAttributeName: UIFont.systemFontOfSize(--fontSize)])
            }
            
            label.font = UIFont.systemFontOfSize(fontSize)
            label.text = string
        }
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        func configure(){
            
            var startAngle : CGFloat = CGFloat()
            var endAngle   : CGFloat = CGFloat()
            
            switch startingPoint {
                
            case .Top:
                startAngle = CGFloat(M_PI * -0.5)
                endAngle   = CGFloat(M_PI * 1.5)
                break
                
            case .Right:
                startAngle = CGFloat(M_PI * 0.0)
                endAngle   = CGFloat(M_PI * 2.0)
                break
                
            case .Bottom:
                startAngle = CGFloat(M_PI * 0.5)
                endAngle   = CGFloat(M_PI * 2.5)
                break
                
            case .Left:
                startAngle = CGFloat(M_PI * 1)
                endAngle   = CGFloat(M_PI * 3)
                break
                
            default:
                break
                
            }
            
            if !clockwise {
                
                let aux = startAngle
                startAngle = endAngle
                endAngle = aux
            }
            
            var circlePath = UIBezierPath(arcCenter: CGPoint(x: self.bounds.size.width/2, y: self.bounds.height/2), radius: (frame.size.width - frame.size.width*0.05)/2, startAngle: startAngle, endAngle: endAngle , clockwise: clockwise)
            
            backgroundCircle.path = circlePath.CGPath
            backgroundCircle.fillColor = UIColor.clearColor().CGColor
            backgroundCircle.strokeColor = self.backgroundCircleColor.CGColor
            backgroundCircle.lineWidth = frame.size.width * 0.05;
            backgroundCircle.strokeEnd = 1.0;
            layer.addSublayer(backgroundCircle)
            
            // Setup the CAShapeLayer with the path, colors, and line width
            animatedCircle.path = circlePath.CGPath
            animatedCircle.fillColor = UIColor.clearColor().CGColor
            animatedCircle.strokeColor = fillColor.CGColor
            animatedCircle.lineWidth = frame.size.width * 0.05;
            
            // Don't draw the circle initially
            animatedCircle.strokeEnd = 0.0;
            
            // Add the circleLayer to the view's layer's sublayers
            layer.addSublayer(animatedCircle)
            
            
        }
        
        func animate(duration: NSTimeInterval) {
            
            if !userText {
                timer = NSTimer.scheduledTimerWithTimeInterval(Double(Double(duration) / Double(percentage * 100)), target: self, selector: "numberIncrease", userInfo: nil, repeats: true)
            }
            
            // We want to animate the strokeEnd property of the circleLayer
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            
            // Set the animation duration appropriately
            animation.duration = duration
            
            // Animate from 0 (no circle) to 1 (full circle)
            animation.fromValue = 0
            animation.toValue = self.percentage
            
            // Do a linear animation (i.e. the speed of the animation stays the same)
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            
            // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
            // right value when the animation ends.
            animatedCircle.strokeEnd = self.percentage
            
            // Do the actual animation
            animatedCircle.addAnimation(animation, forKey: "animateCircle")
        }
        
        
        func numberIncrease(){
            
            if(self.auxNumber < percentage){
                
                self.auxNumber += 0.01;
                label.text = "\(Int(self.auxNumber * 100))%"
                
            } else {
                timer.invalidate()
            }
        }
        
    }
    
    //Bonus, UIFont extension to calculate the size of a STRING
    extension UIFont {
        
        func sizeOfString (string: NSString, constrainedToWidth width: Double) -> CGSize {
            
            return string.boundingRectWithSize(CGSize(width: width, height: DBL_MAX),
                options: NSStringDrawingOptions.UsesLineFragmentOrigin,
                attributes: [NSFontAttributeName: self],
                context: nil).size
        }
    

}
