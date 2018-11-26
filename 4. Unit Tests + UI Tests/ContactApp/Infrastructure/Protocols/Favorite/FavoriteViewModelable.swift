//
//  FavoriteViewModelable.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import Foundation
import RxCocoa

protocol FavoriteViewModelable {
    init(view: FavoriteViewable?)
    var isButtonVisible: BehaviorRelay<Bool> { get set }
    var isFavorited: BehaviorRelay<Bool> { get set }
    func tapFavorite()
}
