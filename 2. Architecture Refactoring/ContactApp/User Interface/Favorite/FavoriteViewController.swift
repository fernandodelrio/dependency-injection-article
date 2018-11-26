//
//  FavoriteViewController.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    lazy var favoriteButton = UIButton(type: .system)
    
    var isFavorited = false
    
    override func viewDidLoad() {
        // Adding subview
        view.addSubview(favoriteButton)
        
        // Setting up constraints
        setupFavoriteButtonConstraints()
        setupViewContraints()
        
        favoriteButton.accessibilityIdentifier = "favoriteButton"
        
        favoriteButton.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        
        // Setting up button initial state
        favoriteButton.isHidden = true
        updateFavoriteButton(isFavorited: false)
    }
    
    @objc func didTapFavoriteButton() {
        isFavorited = !isFavorited
        updateFavoriteButton(isFavorited: isFavorited)
    }
    
    func updateFavoriteButton(isFavorited: Bool) {
        let image = isFavorited ? UIImage(named: "love-icon-selected") : UIImage(named: "love-icon-unselected")
        favoriteButton.setImage(image, for: .normal)
    }
    
    private func setupFavoriteButtonConstraints() {
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = favoriteButton.heightAnchor.constraint(equalToConstant: 20)
        let widthConstraint = favoriteButton.widthAnchor.constraint(equalToConstant: 20)
        let centerXConstraint = favoriteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let centerYConstraint = favoriteButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        view.addConstraints([heightConstraint, widthConstraint, centerXConstraint, centerYConstraint])
    }
    
    private func setupViewContraints() {
        let viewWidthConstraint = view.widthAnchor.constraint(equalToConstant: 20)
        let viewHeightConstraint = view.heightAnchor.constraint(equalToConstant: 20)
        
        view.addConstraints([viewWidthConstraint, viewHeightConstraint])
    }
}
