//
//  Swinjector.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import Foundation
import Swinject

class Swinjector {
    static var defaultContainer = Container()
    
    static func register() {        
        defaultContainer
            .register(ContactViewable.self) { resolver in
                let storyboard = UIStoryboard(name: "Contact", bundle: nil)
                let viewController = storyboard.instantiateInitialViewController() as? ContactViewController
                viewController?.favoriteView = resolver.resolve(FavoriteViewable.self)
                return viewController ?? ContactViewController()
            }
            .initCompleted { resolver, view in
                view.viewModel = resolver.resolve(ContactViewModelable.self)
            }
        
        defaultContainer
            .register(FavoriteViewable.self) { _ in
                return FavoriteViewController()
            }
            .initCompleted { resolver, view in
                view.viewModel = resolver.resolve(FavoriteViewModelable.self)
            }

        defaultContainer.register(ContactViewModelable.self) { resolver in
            let viewModel = ContactViewModel(view: resolver.resolve(ContactViewable.self))
            viewModel.provider = resolver.resolve(ContactProvidable.self)
            return viewModel
        }

        defaultContainer.register(FavoriteViewModelable.self) { resolver in
            return FavoriteViewModel(view: resolver.resolve(FavoriteViewable.self))
        }

        defaultContainer.register(ContactProvidable.self) { resolver in
            let provider = ContactProvider()
            provider.provider = resolver.resolve(Providable.self)
            return provider
        }

        defaultContainer.register(Providable.self) { resolver in
            return NetworkProvider()
        }
    }
}
