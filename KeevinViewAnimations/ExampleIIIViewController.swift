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
        /*
        In the below, we create frames that represent what we want for the two stages of animating the view. smallFrame shrinks to half the size of alertView, maintaining the center point and finalFrame has a position at the bottom of the screen, out of view.
        
        We use a Keyframe animation with two keyframes. The first sets alertView’s frame to smallFrame and the second to finalFrame. The result will be that the alertView will shrink to half its size and then fall out of view. Notice I have put such a large number for the duration – 4 seconds. You can change this, I just wanted the animation running in slow-motion for the demo

*/
        
        let bounds = alertView.bounds
        let smallFrame = CGRectInset(alertView.frame, alertView.frame.size.width / 4, alertView.frame.size.height / 4)
        let finalFrame = CGRectOffset(smallFrame, 0, bounds.size.height)
        
        let snapshot = alertView.snapshotViewAfterScreenUpdates(false)
        snapshot.frame = alertView.frame
        view.addSubview(snapshot)
        alertView.removeFromSuperview()
        
        /*
        The animation isn’t quite what we expected. You can see the red alertView animate as expected, but the scale of its children doesn’t change. Changing the parent’s frame, doesn’t automatically change its children’s frames.
        
        We’ll use a feature introduced in iOS 7 called UIView snapshots to fix the animation. This allows you to take a snapshot of a UIView together with its hierarchy and render it into a new UIView.
        */
        
        
//        UIView.animateKeyframesWithDuration(4, delay: 0, options: .CalculationModeCubic, animations: {
//            
//            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5) {
//                self.alertView.frame = smallFrame
//            }
//            
//            UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 0.5) {
//                self.alertView.frame = finalFrame
//            }
//            }, completion: nil)
        UIView.animateKeyframesWithDuration(4, delay: 0, options: .CalculationModeCubic, animations: {
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5) {
                snapshot.frame = smallFrame
            }
            UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 0.5) {
                snapshot.frame = finalFrame
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
