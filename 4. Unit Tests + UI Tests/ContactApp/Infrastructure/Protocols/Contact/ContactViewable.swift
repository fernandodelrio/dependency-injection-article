//
//  ContactViewable.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit

protocol ContactViewable: AnyObject, Loadable {
    var viewModel: ContactViewModelable? { get set }
    var favoriteView: FavoriteViewable? { get set }
    var photoImageView: UIImageView? { get set }
    var nameLabel: UILabel? { get set }
    var descriptionLabel: UILabel? { get set }
}
