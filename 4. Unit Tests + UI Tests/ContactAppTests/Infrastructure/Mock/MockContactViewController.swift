//
//  MockContactViewController.swift
//  ContactAppTests
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit
@testable import ContactApp

class MockContactViewController: ContactViewable {
    var viewModel: ContactViewModelable? {
        didSet {
            if let viewModel = viewModel as? ContactViewModel {
                viewModel.bindOutlets()
            }
        }
    }
    
    var photoImageView: UIImageView? = UIImageView()
    var nameLabel: UILabel? = UILabel()
    var descriptionLabel: UILabel? = UILabel()
    var favoriteView: FavoriteViewable?
    var loadingPresented = false
    
    func showLoading() {
        loadingPresented = true
    }
    
    func hideLoading() {
        loadingPresented = false
    }
}
