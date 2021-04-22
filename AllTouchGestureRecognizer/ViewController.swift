//
//  ViewController.swift
//  AllTouchGestureRecognizer
//
//  Created by Konstantin Victorovich Erokhin on 22/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var trafficLight: UIView!
    var gestureRecognizer: AllTouchGestureRecognizer?
    
    @objc
    @IBAction func fired(_ gestureRecognizer: UIGestureRecognizer) {
        switch self.gestureRecognizer?.state {
        case .began:
            self.trafficLight.backgroundColor = .orange
        case .changed:
            self.trafficLight.backgroundColor = .green
        default:
            self.trafficLight.backgroundColor = .red
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if self.gestureRecognizer == nil {
            let newGR = AllTouchGestureRecognizer(target: self, action: #selector(fired(_:)))
            self.textView.addGestureRecognizer(newGR)
            self.gestureRecognizer = newGR
        }
    }

}

