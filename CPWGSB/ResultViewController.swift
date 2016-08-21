//
//  ResultViewController.swift
//  CPWGSB
//
//  Created by Peter Spitzer on 08/08/2016.
//  Copyright © 2016 Spitzer IT. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultBackgroundImageOutlet: UIImageView!
    @IBOutlet weak var resultOutlet: UILabel!
    @IBOutlet weak var shareButtonImageView: UIImageView!
    @IBOutlet weak var closeButtonImageView: UIImageView!
    
    var result: Double = 0.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let twoDecimals = String(format: "%.2f", result)
        resultOutlet.text = "£\(twoDecimals)"
        
   //     self.navigationItem.backBarButtonItem?.tintColor = UIColor.whiteColor()
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipedDown(_:)))
        swipeRecognizer.direction = .Down
        self.view.addGestureRecognizer(swipeRecognizer)
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(ResultViewController.shareTapped(_:)))
        shareButtonImageView.userInteractionEnabled = true
        shareButtonImageView.addGestureRecognizer(tapGestureRecognizer)
        
        let closeButtonTapReccognizer = UITapGestureRecognizer(target:self, action:#selector(swipedDown(_:)))
        closeButtonImageView.userInteractionEnabled = true
        closeButtonImageView.addGestureRecognizer(closeButtonTapReccognizer)
        
        applyMotionEffect(toView: resultOutlet, magnitude: 10)
        applyMotionEffect(toView: resultBackgroundImageOutlet, magnitude: -20)
        applyMotionEffect(toView: shareButtonImageView, magnitude: -20)
        applyMotionEffect(toView: closeButtonImageView, magnitude: -20)
        
        
        
    }
    
    func shareTapped(object: AnyObject) {
        
        let bounds = UIScreen.mainScreen().bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        self.view.drawViewHierarchyInRect(bounds, afterScreenUpdates: false)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let activityViewController = UIActivityViewController(activityItems: [img], applicationActivities: nil)
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    func swipedDown(gesture: UIGestureRecognizer) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func applyMotionEffect(toView view: UIView, magnitude: Float){
        
        let xMotion = UIInterpolatingMotionEffect(keyPath: "centre.x", type: .TiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = -magnitude
        xMotion.maximumRelativeValue = magnitude
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "centre.y", type: .TiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = -magnitude
        yMotion.maximumRelativeValue = magnitude
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [xMotion, yMotion]
        
        view.addMotionEffect(group)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
