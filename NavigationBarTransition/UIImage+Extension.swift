//
//  UIImage+Extension.swift
//  NavigationBarTransition
//
//  Created by Moch Xiao on 3/27/16.
//  Copyright © 2016 Moch. All rights reserved.
//

import UIKit

public extension UIImage {
    public class func imageWithColor(color: UIColor, size: CGSize = CGSizeMake(1, 1)) -> UIImage {
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        let rect = CGRectMake(0, 0, size.width, size.height)
        CGContextFillRect(context, rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}

public func UIImageFromColor(color: UIColor, size: CGSize = CGSizeMake(1, 1)) -> UIImage {
    return UIImage.imageWithColor(color, size: size)
}
