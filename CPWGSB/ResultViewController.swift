//
//  ResultViewController.swift
//  CPWGSB
//
//  Created by Peter Spitzer on 08/08/2016.
//  Copyright © 2016 Spitzer IT. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultOutlet: UILabel!
    @IBOutlet weak var shareButtonImageView: UIImageView!
    var result: Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let twoDecimals = String(format: "%.2f", result)
        resultOutlet.text = "£\(twoDecimals)"
        
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.whiteColor()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(ResultViewController.shareTapped(_:)))
        shareButtonImageView.userInteractionEnabled = true
        shareButtonImageView.addGestureRecognizer(tapGestureRecognizer)
        
        
    }
    
    func shareTapped(object: AnyObject) {
        // Your action
        let sharedText = "My GSB reward today is \(resultOutlet.text!). Calculated it with CPBGSB."
        let activityViewController = UIActivityViewController(activityItems: [sharedText], applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: {})
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
