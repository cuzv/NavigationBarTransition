//
//  UITabBar+CustomHeight.swift
//  NavigationBarTransition
//
//  Created by Moch Xiao on 3/27/16.
//  Copyright © 2016 Moch. All rights reserved.
//

import UIKit

extension UITabBar {
    override public func sizeThatFits(size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 44
        return sizeThatFits
    }
}
