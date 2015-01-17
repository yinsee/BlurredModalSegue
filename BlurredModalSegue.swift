//
//  BlurredModalSegue.swift
//  Banjir
//
//  Created by Daddycat on 1/17/15.
//  Copyright (c) 2015 chimou. All rights reserved.
//

import UIKit

class BlurredModalSegue: UIStoryboardSegue {
    
    var blurRadius: CGFloat
    var tintColor: UIColor
    var saturationDeltaFactor: CGFloat
    

    override init!(identifier: String!, source: UIViewController, destination: UIViewController) {
        
        blurRadius = 20
        tintColor = UIColor.clearColor()
        saturationDeltaFactor = 0.5
        
        super.init(identifier: identifier, source: source, destination: destination)

    
    }
    
    override func perform() {
        
        let effect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let effectView = UIVisualEffectView(effect: effect)
        let destination = destinationViewController as UIViewController
        destination.view.backgroundColor = UIColor.clearColor()
        if (destination is UITableViewController) {
            (destinationViewController as UITableViewController).tableView.backgroundView = effectView
        }
        else
        {
            destination.view.insertSubview(effectView, atIndex: 0)
            effectView.setTranslatesAutoresizingMaskIntoConstraints(false)
            effectView.superview?.addConstraint(NSLayoutConstraint(item: effectView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: effectView.superview, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0))
            effectView.superview?.addConstraint(NSLayoutConstraint(item: effectView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: effectView.superview, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0))
            effectView.superview?.addConstraint(NSLayoutConstraint(item: effectView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: effectView.superview, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0))
            effectView.superview?.addConstraint(NSLayoutConstraint(item: effectView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: effectView.superview, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0))
        }
        
        destination.modalPresentationStyle = UIModalPresentationStyle.OverFullScreen
        sourceViewController.presentViewController(destinationViewController as UIViewController, animated: true, completion: nil)
        destinationViewController.transitionCoordinator()?.animateAlongsideTransition(nil, completion: nil)
        
    }
}
