//
//  BNFilterContainerVC.swift
//  CustomModelSegue
//
//  Created by luojie on 15/12/21.
//  Copyright © 2015年 LuoJie. All rights reserved.
//  Demo Url: https://github.com/beeth0ven/CustomModelSegue

import UIKit

// This VC is required, and controls the animation
public class BNFilterContainerVC: UIViewController {
    
    @IBOutlet weak var containerTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerLeadingConstraint: NSLayoutConstraint!
    
    public var configRootViewController:((UIViewController) -> Void)?
    
    private var isContainerShowed: Bool! {
        didSet {
            containerTrailingConstraint.active = isContainerShowed
            containerLeadingConstraint.active = !isContainerShowed
        }
    }
    
    // Appear
    private var isSizeUpdated = false
    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard !isSizeUpdated else { return }
        isSizeUpdated = true
        // Fix a bug: story board will override the constraint's active state which is setted by code before viewDidLayoutSubviews.
        // So after viewDidLayoutSubviews we change the active state.
        
        // Set default constraint state below:
        isContainerShowed = false
        view.layoutIfNeeded()
        
        // Do the animation and show container
        dispatch_async(dispatch_get_main_queue()) { // Fix a bug
            self.isContainerShowed = true
            UIView.animateWithDuration(0.3) { self.view.layoutIfNeeded() }
        }
    }
    
    // Disappear
    override public func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        isContainerShowed = false
        UIView.animateWithDuration(0.3) { self.view.layoutIfNeeded() }
    }
    
    @IBAction func doClose() {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let rootViewController = segue.destinationViewController
        print("---\(rootViewController)")
        configRootViewController?(rootViewController)
    }
}


