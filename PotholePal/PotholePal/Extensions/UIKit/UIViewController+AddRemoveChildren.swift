//
//  UIViewController+AddRemoveChildren.swift
//  PotholePal
//
//  Created by Thayallan Srinathan on 2019-01-19.
//  Copyright © 2019 Thayallan Srinathan. All rights reserved.
//

import UIKit

extension UIViewController {
    func add(childController: UIViewController, at index: Int? = nil) {
        addChild(childController)
        if let index = index {
            view.insertSubview(childController.view, at: index)
        } else {
            view.addSubview(childController.view)
        }
        childController.didMove(toParent: self)
    }
    
    func remove(childController: UIViewController) {
        childController.willMove(toParent: nil)
        childController.view.removeFromSuperview()
        childController.removeFromParent()
    }
}
