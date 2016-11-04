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
    @IBOutlet weak var deadImageView: UIImageView!
    @IBOutlet weak var excitedImageView: UIImageView!
    @IBOutlet weak var happyImageView: UIImageView!
    @IBOutlet weak var sadImageView: UIImageView!
    @IBOutlet weak var tongueImageView: UIImageView!
    @IBOutlet weak var winkImageView: UIImageView!
    
    
    var trayOriginalCenter: CGPoint!
    var trayCenterWhenOpen: CGPoint!
    var trayCenterWhenClosed: CGPoint!
    
    var newlyCreatedFace: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        trayCenterWhenOpen = CGPoint(x: self.view.frame.size.width/2, y: trayView.frame.origin.y + 50)
        trayCenterWhenClosed = CGPoint(x: self.view.frame.size.width/2, y: trayView.frame.origin.y + 295)
        
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
    
    @IBAction func onDeadPanGesture(_ sender: UIPanGestureRecognizer) {
        
        let point = sender.location(in: view)
        
        if sender.state == UIGestureRecognizerState.began {
            // Gesture recognizers know the view they are attached to
            let imageView = sender.view as! UIImageView
            
            // Create a new image view that has the same image as the one currently panning
            newlyCreatedFace = UIImageView(image: imageView.image)
            
            // Add the new face to the tray's parent view.
            view.addSubview(newlyCreatedFace)
            
            // Initialize the position of the new face.
            newlyCreatedFace.center = imageView.center
            
            // Since the original face is in the tray, but the new face is in the
            // main view, you have to offset the coordinates
            newlyCreatedFace.center.y += trayView.frame.origin.y
        } else if sender.state == UIGestureRecognizerState.changed {
            print("Gesture changed at: \(point)")
            deadImageView.center = CGPoint(x: point.x, y: point.y - trayView.frame.origin.y)
        } else if sender.state == UIGestureRecognizerState.ended {
            
        }
    }
    

    @IBAction func onExcitedPanGesture(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: view)
        
        if sender.state == UIGestureRecognizerState.began {
            // Gesture recognizers know the view they are attached to
            let imageView = sender.view as! UIImageView
            
            // Create a new image view that has the same image as the one currently panning
            newlyCreatedFace = UIImageView(image: imageView.image)
            
            // Add the new face to the tray's parent view.
            view.addSubview(newlyCreatedFace)
            
            // Initialize the position of the new face.
            newlyCreatedFace.center = imageView.center
            
            // Since the original face is in the tray, but the new face is in the
            // main view, you have to offset the coordinates
            newlyCreatedFace.center.y += trayView.frame.origin.y
        } else if sender.state == UIGestureRecognizerState.changed {
            print("Gesture changed at: \(point)")
            excitedImageView.center = CGPoint(x: point.x, y: point.y - trayView.frame.origin.y)
        } else if sender.state == UIGestureRecognizerState.ended {
            
        }
    }
    
    @IBAction func onHappyPanGesture(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: view)
        
        if sender.state == UIGestureRecognizerState.began {
            // Gesture recognizers know the view they are attached to
            let imageView = sender.view as! UIImageView
            
            // Create a new image view that has the same image as the one currently panning
            newlyCreatedFace = UIImageView(image: imageView.image)
            
            // Add the new face to the tray's parent view.
            view.addSubview(newlyCreatedFace)
            
            // Initialize the position of the new face.
            newlyCreatedFace.center = imageView.center
            
            // Since the original face is in the tray, but the new face is in the
            // main view, you have to offset the coordinates
            newlyCreatedFace.center.y += trayView.frame.origin.y
        } else if sender.state == UIGestureRecognizerState.changed {
            print("Gesture changed at: \(point)")
            happyImageView.center = CGPoint(x: point.x, y: point.y - trayView.frame.origin.y)
        } else if sender.state == UIGestureRecognizerState.ended {
            
        }
    }
    
    @IBAction func onSadPanGesture(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: view)
        
        if sender.state == UIGestureRecognizerState.began {
            // Gesture recognizers know the view they are attached to
            let imageView = sender.view as! UIImageView
            
            // Create a new image view that has the same image as the one currently panning
            newlyCreatedFace = UIImageView(image: imageView.image)
            
            // Add the new face to the tray's parent view.
            view.addSubview(newlyCreatedFace)
            
            // Initialize the position of the new face.
            newlyCreatedFace.center = imageView.center
            
            // Since the original face is in the tray, but the new face is in the
            // main view, you have to offset the coordinates
            newlyCreatedFace.center.y += trayView.frame.origin.y
        } else if sender.state == UIGestureRecognizerState.changed {
            print("Gesture changed at: \(point)")
            sadImageView.center = CGPoint(x: point.x, y: point.y - trayView.frame.origin.y)
        } else if sender.state == UIGestureRecognizerState.ended {
            
        }
    }
    
    @IBAction func onTonguePanGesture(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: view)
        
        if sender.state == UIGestureRecognizerState.began {
            // Gesture recognizers know the view they are attached to
            let imageView = sender.view as! UIImageView
            
            // Create a new image view that has the same image as the one currently panning
            newlyCreatedFace = UIImageView(image: imageView.image)
            
            // Add the new face to the tray's parent view.
            view.addSubview(newlyCreatedFace)
            
            // Initialize the position of the new face.
            newlyCreatedFace.center = imageView.center
            
            // Since the original face is in the tray, but the new face is in the
            // main view, you have to offset the coordinates
            newlyCreatedFace.center.y += trayView.frame.origin.y
        } else if sender.state == UIGestureRecognizerState.changed {
            print("Gesture changed at: \(point)")
            tongueImageView.center = CGPoint(x: point.x, y: point.y - trayView.frame.origin.y)
        } else if sender.state == UIGestureRecognizerState.ended {
            
        }
    }
    
    @IBAction func onWinkPanGesture(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: view)
        
        if sender.state == UIGestureRecognizerState.began {
            // Gesture recognizers know the view they are attached to
            let imageView = sender.view as! UIImageView
            
            // Create a new image view that has the same image as the one currently panning
            newlyCreatedFace = UIImageView(image: imageView.image)
            
            // Add the new face to the tray's parent view.
            view.addSubview(newlyCreatedFace)
            
            // Initialize the position of the new face.
            newlyCreatedFace.center = imageView.center
            
            // Since the original face is in the tray, but the new face is in the
            // main view, you have to offset the coordinates
            newlyCreatedFace.center.y += trayView.frame.origin.y
        } else if sender.state == UIGestureRecognizerState.changed {
            print("Gesture changed at: \(point)")
            winkImageView.center = CGPoint(x: point.x, y: point.y - trayView.frame.origin.y)
        } else if sender.state == UIGestureRecognizerState.ended {
            
        }
    }
    
}

