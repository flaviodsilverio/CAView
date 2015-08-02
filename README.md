# CAView

This is a simple animated Circle view made in Swift. It is meant to simulate the Circle Views with Data found on various websites so you can have it in your iOS APP

# Usage

The usage is pretty simple and straightforward. First of all you need to configure it and then you just need to animate it whenever/wherever you want.

# Configuration

As an example of a simple 100% loading indicator with the default colors, you can just have this code for the initiation:

        let circle = CAView(frame: CGRectMake(50, 50, 100, 100))
        circle.configure()
        self.view.addSubview(circle)

Amd then, whenever/whetever you wanna animate it you just have to call:

        circle.animate(2.0)

Congrats, now you have a simple view which will take 2 seconds to animate until 100%!

# Options

There's loads of configurable options, for example, let's imagine you want a circle that will Animate Counter ClockWise starting from the far left and animating only until 17%. You can simply do it like this:

        let circle = CAView(frame: CGRectMake(50, 225, 100, 100))
        circle.percentage = 0.17
        circle.clockwise = false
        circle.startingPoint = CAView.StartingPoint.Left
        circle.configure()
        self.view.addSubview(circle)
        
After that you just need to animate it:

        circle.animate(1.0)
        
Now Let's say you hate those colors and want to change them so the background color is black, the background of the circle yellow, and the text and animated circle are red, you can just add these lines BEFORE the .configure() call.

        circle.backgroundColor = UIColor.blackColor()
        circle.backgroundCircleColor = UIColor.yellowColor()
        circle.fillColor = UIColor.redColor()
        
Finnaly, let's say you want a label with your own text and without animation, you can create it just like this:

        let circle = CAView(frame: CGRectMake(200, 50, 100, 100))
        circle.setText("My Text")
        circle.backgroundCircleColor = UIColor.blackColor()
        circle.configure()
        circle.label.textColor = UIColor.redColor()

In case you change your mind and let's say after all you do want a animation that starts on the bottom, occupies half of the circle and is colored Yellow, you just have to add the following before the configure() call:

        circle.percentage = 0.5
        circle.startingPoint = CAView.StartingPoint.Bottom
        circle.fillColor = UIColor.yellowColor()
        
Now you just have to animate the view Whenever you like, ie.:

        circle.animate(0.2)
        
# Contact

Any questions or suggestions feel free to send me a message :)
        
# Licence

The MIT License (MIT)

Copyright (c) 2015 Flávio Silvério

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

