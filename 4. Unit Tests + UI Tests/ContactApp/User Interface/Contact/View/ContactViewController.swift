//
//  ContactViewController.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, ContactViewable, Loadable {
    @IBOutlet weak var stackView: UIStackView?
    @IBOutlet weak var photoImageView: UIImageView?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    
    var favoriteView: FavoriteViewable? {
        set {
            addChild(newValue)
        }
        get {
            return children.first as? FavoriteViewable
        }
    }
    
    var viewModel: ContactViewModelable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel?.text = ""
        descriptionLabel?.text = ""
        photoImageView?.image = nil
        stackView?.add(favoriteView)
    }
}
