//
//  MockContactViewModel.swift
//  UnitTests
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit
import RxCocoa
@testable import ContactApp

class MockContactViewModel: ContactViewModelable {
    var view: ContactViewable?
    var provider: ContactProvidable?
    
    var name = BehaviorRelay<String?>(value: nil)
    var description = BehaviorRelay<String?>(value: nil)
    var photo = BehaviorRelay<UIImage?>(value: nil)
    
    let devicesPortrait: [(model: String, size: CGSize)]
    let devicesLandscape: [(model: String, size: CGSize)]
    
    enum Setting {
        case dataLoading
        case dataLoaded
        case longName
        case shortName
        case longDescription
        case shortDescription
        case favoriteSelected
        case favoriteUnselected
        case nameBackground
        case descriptionBackground
        case favoriteBackground
    }
    
    var settings: [Setting] = [] {
        didSet {
            guard let mockProvider = provider?.provider as? MockNetworkProvider else {
                return
            }
            settings.forEach { state in
                switch state {
                case .dataLoading:
                    name.accept(nil)
                    description.accept(nil)
                    photo.accept(nil)
                    let v = view as? ContactViewController
                    v?.view.backgroundColor = .white
                    view?.nameLabel?.backgroundColor = .clear
                    view?.descriptionLabel?.backgroundColor = .clear
                    view?.favoriteView?.favoriteButton.backgroundColor = .clear
                    view?.favoriteView?.viewModel?.isFavorited.accept(false)
                    mockProvider.useShortName = false
                    mockProvider.useShortDescription = false
                    view?.favoriteView?.viewModel?.isButtonVisible.accept(false)
                    view?.showLoading()
                case .dataLoaded:
                    view?.favoriteView?.viewModel?.isButtonVisible.accept(true)
                    view?.hideLoading()
                case .longName:
                    mockProvider.useShortName = false
                case .shortName:
                    mockProvider.useShortName = true
                case .longDescription:
                    mockProvider.useShortDescription = false
                case .shortDescription:
                    mockProvider.useShortDescription = true
                case .favoriteSelected:
                    view?.favoriteView?.viewModel?.isFavorited.accept(true)
                case .favoriteUnselected:
                    view?.favoriteView?.viewModel?.isFavorited.accept(false)
                case .nameBackground:
                    view?.nameLabel?.backgroundColor = .green
                case .descriptionBackground:
                    view?.descriptionLabel?.backgroundColor = .green
                case .favoriteBackground:
                    view?.favoriteView?.favoriteButton.backgroundColor = .green
                }
            }
            if settings.contains(.dataLoading) {
                return
            }
            provider?.getContact { [weak self] contact, image in
                self?.name.accept(contact?.name)
                self?.description.accept(contact?.description)
                self?.photo.accept(image)
            }
        }
    }
    
    required init(view: ContactViewable?) {
        self.view = view
        Rx.bind(view?.nameLabel, property: name)
        Rx.bind(view?.descriptionLabel, property: description)
        Rx.bind(view?.photoImageView, property: photo)
        devicesPortrait =
            DeviceScreen.allCases.map { (model: $0.rawValue, size: $0.size(orientation: .portrait)) }
        devicesLandscape =
            DeviceScreen.allCases.map { (model: $0.rawValue, size: $0.size(orientation: .landscapeLeft)) }
    }
    
    func load() {
        settings = [.dataLoading]
    }
    
    func verifyView(handler: (String) -> Void) {
        guard let view = view as? UIViewController else {
            return
        }
        
        devicesPortrait.forEach { device in
            view.view.frame = CGRect(origin: .zero, size: device.size)
            handler("\(device.model)-Portrait")
        }
        
        devicesLandscape.forEach { device in
            view.view.frame = CGRect(origin: .zero, size: device.size)
            handler("\(device.model)-Landscape")
        }
    }
}
