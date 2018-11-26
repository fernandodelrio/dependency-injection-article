//
//  UIViewController.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit

extension UIViewController {
    func addChild(_ child: AnyObject?) {
        if let child = child as? UIViewController {
            addChild(child)
            child.didMove(toParent: self)
        }
    }
}
