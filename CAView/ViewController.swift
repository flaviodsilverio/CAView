//
//  ViewController.swift
//  CAView
//
//  Created by Flávio Silvério
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var button = UIButton(frame: CGRectMake(50, 175, 100, 50))
        button.addTarget(self, action: "simpleView", forControlEvents: UIControlEvents.TouchUpInside)
        button.setTitle("Simple View", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.grayColor()
        self.view.addSubview(button)
        
        //circle that will Animate Counter ClockWise starting from the far left and animating only until 17%
        
        var button2 = UIButton(frame: CGRectMake(50, 350, 100, 50))
        button2.addTarget(self, action: "exampleTwo", forControlEvents: UIControlEvents.TouchUpInside)
        button2.setTitle("Example 2", forState: UIControlState.Normal)
        button2.backgroundColor = UIColor.grayColor()
        self.view.addSubview(button2)
        
        
        var button3 = UIButton(frame: CGRectMake(200, 175, 100, 50))
        button3.addTarget(self, action: "exampleThree", forControlEvents: UIControlEvents.TouchUpInside)
        button3.setTitle("Example 3", forState: UIControlState.Normal)
        button3.backgroundColor = UIColor.grayColor()
        self.view.addSubview(button3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func simpleView(){
    
        self.view.viewWithTag(200)?.removeFromSuperview()
        
        let circle = CAView(frame: CGRectMake(50, 50, 100, 100))
        circle.tag = 200
        self.view.addSubview(circle)
        
        circle.animate(2.0)
    
    }
    
    //circle that will Animate Counter ClockWise starting from the far left and animating only until 17%

    func exampleTwo(){
        
        self.view.viewWithTag(201)?.removeFromSuperview()

        let circle = CAView(frame: CGRectMake(50, 245, 100, 100))
        circle.percentage = 0.17
        circle.clockwise = false
        circle.startingPoint = CAView.StartingPoint.Left
        circle.backgroundColor = UIColor.blackColor()
        circle.backgroundCircleColor = UIColor.yellowColor()
        circle.fillColor = UIColor.redColor()
        self.view.addSubview(circle)
        
        circle.fillColor = UIColor.purpleColor()
        circle.tag = 201

        
        circle.animate(3.0)
    }
    
    
    func exampleThree(){
        
        self.view.viewWithTag(202)?.removeFromSuperview()
        
        let circle = CAView(frame: CGRectMake(200, 50, 100, 100))
        circle.setText("My Text")
        circle.backgroundCircleColor = UIColor.blackColor()
        circle.percentage = 0.5
        circle.startingPoint = CAView.StartingPoint.Bottom
        circle.fillColor = UIColor.yellowColor()
        circle.label.textColor = UIColor.redColor()
        self.view.addSubview(circle)
        
        circle.animate(0.2)
        circle.tag = 202
        
        
    }
}

