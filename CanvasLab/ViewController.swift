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
    var trayCenterWhenOpen: CGPoint!
    var trayCenterWhenClosed: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        print("screen height : \(screenHeight)")
        print("frame height : \(self.view.frame.size.height)")
        
        trayCenterWhenOpen = CGPoint(x: self.view.frame.size.width/2, y: (screenHeight - 295))
        trayCenterWhenClosed = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height + 30)
        
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
        let velocity = sender.velocity(in: view)
        
        if sender.state == UIGestureRecognizerState.began {
            print("Gesture began at: \(point)")
            trayOriginalCenter = CGPoint(x: self.view.frame.size.width/2, y: point.y)
        } else if sender.state == UIGestureRecognizerState.changed {
            print("Gesture changed at: \(point)")
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
        } else if sender.state == UIGestureRecognizerState.ended {
            print("Gesture ended at: \(point)")
            
            UIView.animate(withDuration: 0.3, animations: {
                if velocity.y > 0 { // moving down
                    self.trayView.center = self.trayCenterWhenClosed
                } else { // moving up
                    self.trayView.center = self.trayCenterWhenOpen
                }
                self.view.layoutIfNeeded()
            })
        }
    }
    

}

