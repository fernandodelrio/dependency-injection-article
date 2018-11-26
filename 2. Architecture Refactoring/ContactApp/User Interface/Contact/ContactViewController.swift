//
//  ContactViewController.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, Loadable {
    @IBOutlet weak var stackView: UIStackView?
    @IBOutlet weak var photoImageView: UIImageView?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    
    lazy var favoriteView = FavoriteViewController()
    lazy var provider = ContactProvider()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adding Favorite child view controller
        addChild(favoriteView)
        stackView?.add(favoriteView)
        
        // Sets an empty UI before the request
        nameLabel?.text = ""
        descriptionLabel?.text = ""
        photoImageView?.image = nil
        favoriteView.favoriteButton.isHidden = true
        
        // Shows the loading
        showLoading()
        
        // Requests the data
        provider.getContact { [weak self] contact, photoImage in
            // Hides the loading in case of success or failure
            defer {
                self?.hideLoading()
            }
            
            // Check if the provider returned the data
            guard contact != nil, photoImage != nil else {
                return
            }
            
            // Sets the data in the UI
            self?.nameLabel?.text = contact?.name
            self?.descriptionLabel?.text = contact?.description
            self?.photoImageView?.image = photoImage
            
            // Shows the favorite button
            self?.favoriteView.favoriteButton.isHidden = false
        }
    }
}
