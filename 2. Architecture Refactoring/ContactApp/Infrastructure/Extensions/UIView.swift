//
//  UIView.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit

extension UIView {
    func getSubviews<T: UIView>(type: T.Type) -> [T] {
        var result: [T] = []
        for subview in subviews {
            result += subview.getSubviews(type: type) as [T]
            if let subview = subview as? T {
                result.append(subview)
            }
        }
        return result
    }
}
