//
//  FavoriteViewable.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit

protocol FavoriteViewable: AnyObject {
    var favoriteButton: UIButton { get set }
    var viewModel: FavoriteViewModelable? { get set }
    func updateFavoriteButton(isFavorited: Bool)
}
