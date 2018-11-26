//
//  Loadable.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit

protocol Loadable {
    func showLoading()
    func hideLoading()
}

extension Loadable where Self: UIViewController {
    func showLoading() {
        let nibViews = Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)
        if let loadingView = nibViews?.first as? LoadingView {
            loadingView.translatesAutoresizingMaskIntoConstraints = false
            
            let topConstraint = loadingView.topAnchor.constraint(equalTo: view.topAnchor)
            let leftConstraint = loadingView.leftAnchor.constraint(equalTo: view.leftAnchor)
            let rightConstraint = loadingView.rightAnchor.constraint(equalTo: view.rightAnchor)
            let bottomConstraint = loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
            view.addSubview(loadingView)
            view.addConstraints([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
        }
    }
    
    func hideLoading() {
        view.getSubviews(type: LoadingView.self)
            .forEach { $0.removeFromSuperview() }
    }
}
