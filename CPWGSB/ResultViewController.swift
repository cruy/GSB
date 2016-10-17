
import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultBackgroundImageOutlet: UIImageView!
    @IBOutlet weak var resultOutlet: UILabel!
    @IBOutlet weak var shareButtonImageView: UIImageView!
    @IBOutlet weak var closeButtonImageView: UIImageView!
    
    var result: Double = 0.0
    var helperMethods = HelperMethods()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let twoDecimals = String(format: "%.2f", result)
        resultOutlet.text = "£\(twoDecimals)"
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipedDown(_:)))
        swipeRecognizer.direction = .down
        self.view.addGestureRecognizer(swipeRecognizer)
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(ResultViewController.shareTapped(_:)))
        shareButtonImageView.isUserInteractionEnabled = true
        shareButtonImageView.addGestureRecognizer(tapGestureRecognizer)
        
        let closeButtonTapReccognizer = UITapGestureRecognizer(target:self, action:#selector(swipedDown(_:)))
        closeButtonImageView.isUserInteractionEnabled = true
        closeButtonImageView.addGestureRecognizer(closeButtonTapReccognizer)
        
        
    }
    
    func shareTapped(_ object: AnyObject) {
        
        let bounds = UIScreen.main.bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        self.view.drawHierarchy(in: bounds, afterScreenUpdates: false)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let activityViewController = UIActivityViewController(activityItems: [img], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func swipedDown(_ gesture: UIGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
        ViewController().tableView.reloadData()
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        helperMethods.popAnimateProperty(resultOutlet)
    }
    

}
