//
//  ViewController.swift
//  CanvasLab
//
//  Created by Nari Shin on 11/3/16.
//  Copyright © 2016 Nari Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trayView: UIView!
    
    var trayOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTrayPanGesture(_ sender: UIPanGestureRecognizer) {
        // Absolute (x,y) coordinates in parent view (parentView should be
        // the parent view of the tray)
        let point = sender.location(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == UIGestureRecognizerState.began {
            print("Gesture began at: \(point)")
            trayOriginalCenter = point
        } else if sender.state == UIGestureRecognizerState.changed {
            print("Gesture changed at: \(point)")
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
        } else if sender.state == UIGestureRecognizerState.ended {
            print("Gesture ended at: \(point)")
        }
    }
    

}

