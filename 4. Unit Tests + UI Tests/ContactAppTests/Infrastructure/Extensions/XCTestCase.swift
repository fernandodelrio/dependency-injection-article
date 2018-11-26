//
//  XCTestCase.swift
//  ContactAppTests
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import Foundation
import XCTest
@testable import Swinject
@testable import ContactApp

extension XCTestCase {
    var mockContainer: Container {
        let container = Container()
        
        container
            .register(ContactViewable.self) { _ in MockContactViewController() }
            .initCompleted { resolver, view in
                view.favoriteView = resolver.resolve(FavoriteViewable.self)
                view.viewModel = resolver.resolve(ContactViewModelable.self)
            }
        
        container
            .register(FavoriteViewable.self) { _ in MockFavoriteViewController() }
            .initCompleted { resolver, view in
                view.viewModel = resolver.resolve(FavoriteViewModelable.self)
            }
        
        container.register(ContactViewModelable.self) { resolver in
            let viewModel = ContactViewModel(view: resolver.resolve(ContactViewable.self))
            viewModel.provider = resolver.resolve(ContactProvidable.self)
            return viewModel
        }
        
        container.register(FavoriteViewModelable.self) { resolver in
            return FavoriteViewModel(view: resolver.resolve(FavoriteViewable.self))
        }
        
        container.register(ContactProvidable.self) { resolver in
            let provider = ContactProvider()
            provider.provider = resolver.resolve(Providable.self)
            return provider
        }
        
        container.register(Providable.self) { resolver in
            return MockNetworkProvider()
        }
        
        return container
    }
    
    var networkContainer: Container {
        let container = Container()
        
        container
            .register(ContactViewable.self) { _ in MockContactViewController() }
            .initCompleted { resolver, view in
                view.favoriteView = resolver.resolve(FavoriteViewable.self)
                view.viewModel = resolver.resolve(ContactViewModelable.self)
            }
        
        container
            .register(FavoriteViewable.self) { _ in MockFavoriteViewController() }
            .initCompleted { resolver, view in
                view.viewModel = resolver.resolve(FavoriteViewModelable.self)
            }
        
        container.register(ContactViewModelable.self) { resolver in
            let viewModel = ContactViewModel(view: resolver.resolve(ContactViewable.self))
            viewModel.provider = resolver.resolve(ContactProvidable.self)
            return viewModel
        }
        
        container.register(FavoriteViewModelable.self) { resolver in
            return FavoriteViewModel(view: resolver.resolve(FavoriteViewable.self))
        }
        
        container.register(ContactProvidable.self) { resolver in
            let provider = ContactProvider()
            provider.provider = resolver.resolve(Providable.self)
            return provider
        }
        
        container.register(Providable.self) { resolver in
            return NetworkProvider()
        }
        
        return container
    }
    
    var snapshotContainer: Container {
        let container = Container()
        
        container
            .register(ContactViewable.self) { resolver in
                let storyboard = UIStoryboard(name: "Contact", bundle: nil)
                let viewController = storyboard.instantiateInitialViewController() as? ContactViewController
                viewController?.addChild(resolver.resolve(FavoriteViewable.self))
                viewController?.loadViewIfNeeded()
                return viewController ?? ContactViewController()
            }
            .initCompleted { resolver, view in
                let viewModel = resolver.resolve(ContactViewModelable.self)
                
                view.viewModel = viewModel
            }
        
        container
            .register(FavoriteViewable.self) { _ in FavoriteViewController() }
            .initCompleted { resolver, view in
                view.viewModel = resolver.resolve(FavoriteViewModelable.self)
            }
        
        container.register(ContactViewModelable.self) { resolver in
            let viewModel = MockContactViewModel(view: resolver.resolve(ContactViewable.self))
            viewModel.provider = resolver.resolve(ContactProvidable.self)
            return viewModel
        }
        
        container.register(FavoriteViewModelable.self) { resolver in
            return FavoriteViewModel(view: resolver.resolve(FavoriteViewable.self))
        }
        
        container.register(ContactProvidable.self) { resolver in
            let provider = ContactProvider()
            provider.provider = resolver.resolve(Providable.self)
            return provider
        }
        
        container.register(Providable.self) { resolver in
            return MockNetworkProvider()
        }
        
        return container
    }
}
