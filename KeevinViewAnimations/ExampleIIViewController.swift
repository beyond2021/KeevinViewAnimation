//
//  ExampleIIViewController.swift
//  KeevinViewAnimations
//
//  Created by KEEVIN MITCHELL on 2/10/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

import UIKit

class ExampleIIViewController: UIViewController {
    
    /*
    Here we create an image view and add it to the main view. We then call imageFadeIn() which creates a second view with a different image. We add this view above the first image view and set its alpha to 0. In the animation block, we animate its alpha value, making it visible. We then use a completion closure to set the image view’s image to the second image and we remove the second image view from the view hierarchy since it is no longer needed. I’ve added a long delay so that the animation doesn’t happen right at the moment we select Example II from the table view. The duration is also a bit long so we can see what’s going on in the demo.
    */
    
    override func viewWillAppear(animated: Bool) {
        
        let firstImageView = UIImageView(image: UIImage(named: "bg01.png"))
        firstImageView.frame = view.frame
        view.addSubview(firstImageView)
        
        imageFadeIn(firstImageView)
        
    }
    
    func imageFadeIn(imageView: UIImageView) {
        
        let secondImageView = UIImageView(image: UIImage(named: "bg02.png"))
        secondImageView.frame = view.frame
        secondImageView.alpha = 0.0
        
        view.insertSubview(secondImageView, aboveSubview: imageView)
        
        UIView.animateWithDuration(2.0, delay: 2.0, options: .CurveEaseOut, animations: {
            secondImageView.alpha = 1.0
            }, completion: {_ in
                imageView.image = secondImageView.image
                secondImageView.removeFromSuperview()
        })
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
