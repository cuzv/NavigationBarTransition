//
//  OpaqueNavigationController.swift
//  NavigationBarTransition
//
//  Created by Moch Xiao on 3/27/16.
//  Copyright © 2016 Moch. All rights reserved.
//

import UIKit

class OpaqueNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactivePopGestureRecognizer?.delegate = self
        
        let image = UIImageFromColor(UIColor.magentaColor())
        navigationBar.setBackgroundImage(image, forBarMetrics: .Default)
        navigationBar.shadowImage = image
    }
    

}


extension OpaqueNavigationController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        // Ignore interactive pop gesture when there is only one view controller on the navigation stack
        if viewControllers.count <= 1 {
            return false
        }
        return true
    }
    
}
