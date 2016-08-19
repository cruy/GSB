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
    var result: Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let twoDecimals = String(format: "%.2f", result)
        resultOutlet.text = "£\(twoDecimals)"
        
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.whiteColor()
        
        
//        let rotation = CABasicAnimation(keyPath: "transform.rotation")
//        rotation.fromValue = 0
//        rotation.toValue = 2 * M_PI
//        rotation.duration = 10
//        rotation.repeatCount = Float.infinity
//        resultBackgroundImageOutlet.layer.addAnimation(rotation, forKey: "Spin")

        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(ResultViewController.shareTapped(_:)))
        shareButtonImageView.userInteractionEnabled = true
        shareButtonImageView.addGestureRecognizer(tapGestureRecognizer)
        
        
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
