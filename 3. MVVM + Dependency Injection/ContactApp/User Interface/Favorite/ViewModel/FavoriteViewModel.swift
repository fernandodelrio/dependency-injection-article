//
//  FavoriteViewModel.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import Foundation
import RxCocoa

class FavoriteViewModel: FavoriteViewModelable {
    weak var view: FavoriteViewable?
    
    var isButtonVisible = BehaviorRelay<Bool>(value: false)
    var isFavorited = BehaviorRelay<Bool>(value: false)
    
    required init(view: FavoriteViewable?) {
        self.view = view
        Rx.bind(view?.favoriteButton, handler: tapFavorite)
        Rx.bind(isFavorited, handler: updateState)
        Rx.bind(isButtonVisible, handler: updateVisibility)
    }
    
    func tapFavorite() {
        isFavorited.accept(!isFavorited.value)
    }
    
    func updateState(_ value: Bool) {
        view?.updateFavoriteButton(isFavorited: value)
    }
    
    func updateVisibility(_ value: Bool) {
        view?.favoriteButton.isHidden = !value
    }
}
