//
//  ExampleIIIViewController.swift
//  KeevinViewAnimations
//
//  Created by KEEVIN MITCHELL on 2/10/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

import UIKit

class ExampleIIIViewController: UIViewController {
    
    var alertView: UIView!
    
    func createView() {
        
        // Create a red view
        let alertWidth: CGFloat = view.bounds.width
        let alertHeight: CGFloat = view.bounds.height
        let alertViewFrame: CGRect = CGRectMake(0, 0, alertWidth, alertHeight)
        alertView = UIView(frame: alertViewFrame)
        alertView.backgroundColor = UIColor.redColor()
        
        // Create an image view and add it to this view
        let imageView = UIImageView(frame: CGRectMake(0, 0, alertWidth, alertHeight/2))
        imageView.image = UIImage(named: "bike_traveler.png")
        alertView.addSubview(imageView)
        
        // Create a button and set a listener on it for when it is tapped. Then the button is added to the alert view
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.setTitle("Dismiss", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.whiteColor()
        let buttonWidth: CGFloat = alertWidth/2
        let buttonHeight: CGFloat = 40
        button.frame = CGRectMake(alertView.center.x - buttonWidth/2, alertView.center.y - buttonHeight/2, buttonWidth, buttonHeight)
        
        button.addTarget(self, action: Selector("dismissAlert"), forControlEvents: UIControlEvents.TouchUpInside)
        
        //When we created the button, we added a listener to it. When the button is tapped, dismissAlert() is called.
        
        alertView.addSubview(button)
        view.addSubview(alertView)
    }
    
    func dismissAlert() {
        
        let bounds = alertView.bounds
        let smallFrame = CGRectInset(alertView.frame, alertView.frame.size.width / 4, alertView.frame.size.height / 4)
        let finalFrame = CGRectOffset(smallFrame, 0, bounds.size.height)
        
        UIView.animateKeyframesWithDuration(4, delay: 0, options: .CalculationModeCubic, animations: {
            
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5) {
                self.alertView.frame = smallFrame
            }
            
            UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 0.5) {
                self.alertView.frame = finalFrame
            }
            }, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

      createView()
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
