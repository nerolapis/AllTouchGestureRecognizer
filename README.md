# AllTouchGestureRecognizer
Example project for a custom UIGestureRecognizer inside UITextView invalidated when it shouldn't be

# Description
## What I want to achieve?
A custom continuous gesture recognizer that performs alongside default/private gesture recognizers of the UITextView without invalidating them and without being invalidated by them.
I want to achieve this in order to be aware when the selection rects are being changed (dragging of the selection grabber dots and changing the selection) because the information is not publicly exposed.
## What did I do?
I've created a custom gesture recognizer, made it the delegate of itself and implemented `shouldRequireFailureOf` and `shouldBeRequiredToFailBy` to return `false` and `shouldRecognizeSimultaneouslyWith` to return `true`. I also implemented the `touchesBegan`, `touchesMoved`, etc to change the state of my custom UIGestureRecognizer.
I've added this custom gesture recognizer to a UITextView.
## What I would expect?
The custom gesture recognizer to fire events for every touch/pan happening inside the UITextView.
## What actually happens?
Whenever I drag the selection grabber dots, my custom UIGestureRecognizer seems to be invalidated by the private UIGestureEnvironment via the `ignore(_:for:)` method.
## So what did I do next?
I've discovered that if I override `ignore(_:for:)` inside my custom UIGestureRecognizer class and don't call super - the gesture recognizer is not invalidated when I drag the grabber dots of the UITextView selection and the result seemed to be exactly what I wanted to achieve, but...
## Then this happened
I discovered that there was a case when my custom gesture recognizer is still invalidated and I don't understand how to make it stop.
If the UITextView is inside a UINavigationController, and the selection grabber dot is near the screen edge on the left, and I drag it - the selection dot is dragged, but my custom gesture recognizer is invalidated.
## So what would I want?
To be able to create a transparent gesture recognizer that is never invalidated from the outside, and does not interfere with other gesture recognizers. I want to be the only one in charge of its `state`, and handle the interaction with other gesture recognizers via the provided delegate methods.
In this case I don’t want the gesture from the screen edge to invalidate my custom gesture recognizer, because in this case it doesn’t happen because the grabber dot is receiving the touch as intended.

Is this possible?

# Configuration
Tested on iPhone 12 Pro Max; iOS 14.4.2.

# Steps to reproduce
* Download the public project https://github.com/nerolapis/AllTouchGestureRecognizer and run it. 
* Press the “Show Text View” button - this will push the controller with the UITextView.
* Start a selection by double-tapping on any word.
* Drag any grabber dot delimiting the selection, to change the selection. As you can see the red square (top-right) becomes green while you drag: this means that the custom gesture recognizer is currently in `.changed` state
* Put the grabber dot near the left margin of the text view; drag it from there - you will notice that the custom gesture recognizer is not recognizer anymore (red square)

**IMPORTANT**: if you are executing the project in the Simulator, make sure in the last point to start dragging some px from the outside of the text view (from the iPhone frame border), like it was a screen edge pan gesture.

All this is is shown in the videos attached to this project:
* Simulator Screen Recording - iPhone 12 Pro Max.mp4 (Simulator)
* RPReplay_Final1619085526.mp4 (Device)