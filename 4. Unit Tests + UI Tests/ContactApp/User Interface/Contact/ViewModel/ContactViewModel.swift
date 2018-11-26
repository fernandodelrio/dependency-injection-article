//
//  ContactViewModel.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit
import RxCocoa

class ContactViewModel: ContactViewModelable {
    var view: ContactViewable?
    var provider: ContactProvidable?
    
    var name = BehaviorRelay<String?>(value: nil)
    var description = BehaviorRelay<String?>(value: nil)
    var photo = BehaviorRelay<UIImage?>(value: nil)
    
    required init(view: ContactViewable?) {
        self.view = view
        Rx.bind(view, selector: #selector(UIViewController.viewDidLoad), handler: load)
        Rx.bind(view, selector: #selector(UIViewController.viewDidLoad), handler: bindOutlets)
    }
    
    func bindOutlets() {
        Rx.bind(view?.nameLabel, property: name)
        Rx.bind(view?.descriptionLabel, property: description)
        Rx.bind(view?.photoImageView, property: photo)
    }
    
    func load() {
        // Shows the loading
        view?.showLoading()
        
        // Gets the data
        provider?.getContact { [weak self] contact, photoImage in
            // Hides the loading in case of success or failure
            defer {
                self?.view?.hideLoading()
            }
            
            // Check if the provider returned the data
            guard contact != nil, photoImage != nil else {
                return
            }
            
            // Sets the data in the UI
            self?.name.accept(contact?.name)
            self?.description.accept(contact?.description)
            self?.photo.accept(photoImage)
            
            // Shows the favorite button
            self?.view?
                .favoriteView?.viewModel?
                .isButtonVisible.accept(true)
        }
    }
}
