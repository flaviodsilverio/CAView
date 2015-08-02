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

