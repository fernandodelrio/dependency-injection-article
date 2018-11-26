//
//  UIStackView.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit

extension UIStackView {
    func add(_ view: AnyObject?) {
        if let view = view as? UIViewController {
            addArrangedSubview(view.view)
        }
    }
}
