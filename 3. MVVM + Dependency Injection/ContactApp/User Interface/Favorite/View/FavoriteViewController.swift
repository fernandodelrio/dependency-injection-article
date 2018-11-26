//
//  FavoriteViewController.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController, FavoriteViewable {
    lazy var favoriteButton = UIButton(type: .system)
    
    var viewModel: FavoriteViewModelable?
    
    override func viewDidLoad() {
        // Adding subview
        view.addSubview(favoriteButton)
        
        // Setting up constraints
        setupFavoriteButtonConstraints()
        setupViewContraints()
        
        favoriteButton.accessibilityIdentifier = "favoriteButton"
        
        // Setting up button initial state
        favoriteButton.isHidden = true
        updateFavoriteButton(isFavorited: false)
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
