//
//  MockFavoriteViewController.swift
//  ContactAppTests
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit
@testable import ContactApp

class MockFavoriteViewController: FavoriteViewable {
    var viewModel: FavoriteViewModelable?
    lazy var favoriteButton = UIButton()
    var isButtonSetWithSelectedImage = false
    
    init() {
        favoriteButton.isHidden = true
        updateFavoriteButton(isFavorited: false)
    }
    
    func updateFavoriteButton(isFavorited: Bool) {
        isButtonSetWithSelectedImage = isFavorited
    }
}
