//
//  MDPassthroughGestureRecognizer.swift
//  MDTextKitUI-iOS
//
//  Created by Konstantin Victorovich Erokhin on 12/04/21.
//

import UIKit

@objc public class AllTouchGestureRecognizer: UIGestureRecognizer, UIGestureRecognizerDelegate {
    
    public override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
        self.delegate = self
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        self.state = .began
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        self.state = .changed
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        self.state = .ended
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        self.state = .ended
    }
    
    public override func reset() {
        super.reset()
    }
    
    public override func ignore(_ touch: UITouch, for event: UIEvent) {
        // We will not call super of ignore() because we don't want to ignore any touch
        // If the super ignore() is called - this gesture recognizer is forced to
        // ignore every time we drag a selection grabber dot of the text view
//        super.ignore(touch, for: event)
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive press: UIPress) -> Bool {
        return true
    }
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive event: UIEvent) -> Bool {
        return true
    }
    
    public override func canBePrevented(by preventingGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    public override func canPrevent(_ preventedGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
}
