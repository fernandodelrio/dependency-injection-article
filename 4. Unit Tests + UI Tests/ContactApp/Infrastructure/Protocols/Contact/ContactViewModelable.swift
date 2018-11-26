//
//  ContactViewModelable.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit
import RxCocoa

protocol ContactViewModelable {
    init(view: ContactViewable?)
    var provider: ContactProvidable? { get set }
    var name: BehaviorRelay<String?> { get set }
    var description: BehaviorRelay<String?> { get set }
    var photo: BehaviorRelay<UIImage?> { get set }
    func load()
}
