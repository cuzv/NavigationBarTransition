//
//  TranslucentViewController.swift
//  NavigationBarTransition
//
//  Created by Moch Xiao on 3/27/16.
//  Copyright © 2016 Moch. All rights reserved.
//

import UIKit

class TranslucentViewController: UIViewController {
    @IBOutlet weak var customNavigationBar: UINavigationBar!
    @IBOutlet weak var textView: UITextView!
    private var ratio: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customNavigationBar.translucent = true
        customNavigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        customNavigationBar.shadowImage = UIImage()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)

        textView.addObserver(self, forKeyPath: "contentOffset", options: .New, context: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        textView.removeObserver(self, forKeyPath: "contentOffset")
    }
    
}


extension TranslucentViewController {
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath != "contentOffset" { return }
        
        let offSetY: CGFloat = textView.contentOffset.y
        ratio = offSetY / 500
        updateAppearance()
    }
    
    private func updateAppearance() {
        let image = UIImageFromColor(UIColor.yellowColor().colorWithAlphaComponent(ratio))
        customNavigationBar?.setBackgroundImage(image, forBarMetrics: .Default)
        customNavigationBar?.shadowImage = image
        
        customNavigationBar.translucent = ratio <= 1
    }
}


extension TranslucentViewController {
    @IBAction func pop(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }

}