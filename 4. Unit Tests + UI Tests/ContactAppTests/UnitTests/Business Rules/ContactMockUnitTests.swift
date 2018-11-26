//
//  ContactMockUnitTests.swift
//  ContactAppTests
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import XCTest
@testable import ContactApp

class ContactMockUnitTests: XCTestCase {
    var view: ContactViewable?
    
    override func setUp() {
        super.setUp()
        view = mockContainer.resolve(ContactViewable.self)
    }
    
    override func tearDown() {
        super.tearDown()
        view?.viewModel?.name.accept(nil)
        view?.viewModel?.description.accept(nil)
        view?.viewModel?.photo.accept(nil)
        view?.favoriteView?.viewModel?.isFavorited.accept(false)
        view?.favoriteView?.viewModel?.isButtonVisible.accept(false)
        if let provider = view?.viewModel?.provider?.provider as? MockNetworkProvider {
            provider.getRouteSuccess = true
            provider.getImageSuccess = true
        }
    }
    
    func testContactAndImageRetrieved() {
        guard let view = view as? MockContactViewController else {
            XCTFail("Unit test should be using mock view controller")
            return
        }
        guard let favoriteViewModel = view.favoriteView?.viewModel else {
            XCTFail("Favorite view model isn't set")
            return
        }
        guard let provider = view.viewModel?.provider?.provider as? MockNetworkProvider else {
            XCTFail("Unit test should be using mock provider")
            return
        }
        // Given
        // view's loading not presented
        // view's name, description, photo fields aren't filled
        // favorite button is hidden
        XCTAssert(!view.loadingPresented)
        XCTAssert(view.nameLabel?.text == nil)
        XCTAssert(view.descriptionLabel?.text == nil)
        XCTAssert(view.photoImageView?.image == nil)
        XCTAssert(!favoriteViewModel.isButtonVisible.value)
        
        // When
        // viewModel's method load is called
        view.viewModel?.load()
        
        // Then
        // view's loading not presented
        // view's name, description, photo fields are filled
        // favorite button is visible
        XCTAssert(!view.loadingPresented)
        XCTAssert(view.nameLabel?.text == "Roberto")
        XCTAssert(view.descriptionLabel?.text == "Not cool guy. Lorem ipsum dolor sit amet, consectetur adipiscing elit")
        XCTAssert(view.photoImageView?.image == provider.mockImage)
        XCTAssert(favoriteViewModel.isButtonVisible.value)
    }
    
    func testContactFail() {
        guard let view = view as? MockContactViewController else {
            XCTFail("Unit test should be using mock view controller")
            return
        }
        guard let favoriteViewModel = view.favoriteView?.viewModel else {
            XCTFail("Favorite view model isn't set")
            return
        }
        guard let provider = view.viewModel?.provider?.provider as? MockNetworkProvider else {
            XCTFail("Unit test should be using mock provider")
            return
        }
        // Given
        // view's loading not presented
        // view's name, description, photo fields aren't filled
        // favorite button is hidden
        XCTAssert(!view.loadingPresented)
        XCTAssert(view.nameLabel?.text == nil)
        XCTAssert(view.descriptionLabel?.text == nil)
        XCTAssert(view.photoImageView?.image == nil)
        XCTAssert(!favoriteViewModel.isButtonVisible.value)
        
        // When
        // viewModel's method load is called and the request fails
        provider.getRouteSuccess = false
        view.viewModel?.load()
        
        // Then
        // view's loading not presented
        // view's name, description, photo fields aren't filled
        // favorite button is hidden
        XCTAssert(!view.loadingPresented)
        XCTAssert(view.nameLabel?.text == nil)
        XCTAssert(view.descriptionLabel?.text == nil)
        XCTAssert(view.photoImageView?.image == nil)
        XCTAssert(!favoriteViewModel.isButtonVisible.value)
    }
    
    func testContactImageFail() {
        guard let view = view as? MockContactViewController else {
            XCTFail("Unit test should be using mock view controller")
            return
        }
        guard let favoriteViewModel = view.favoriteView?.viewModel else {
            XCTFail("Favorite view model isn't set")
            return
        }
        guard let provider = view.viewModel?.provider?.provider as? MockNetworkProvider else {
            XCTFail("Unit test should be using mock provider")
            return
        }
        // Given
        // view's loading not presented
        // view's name, description, photo fields aren't filled
        // favorite button is hidden
        XCTAssert(!view.loadingPresented)
        XCTAssert(view.nameLabel?.text == nil)
        XCTAssert(view.descriptionLabel?.text == nil)
        XCTAssert(view.photoImageView?.image == nil)
        XCTAssert(!favoriteViewModel.isButtonVisible.value)
        
        // When
        // viewModel's method load is called and the image request fails
        provider.getImageSuccess = false
        view.viewModel?.load()
        
        // Then
        // view's loading not presented
        // view's name, description, photo fields aren't filled
        // favorite button is hidden
        XCTAssert(!view.loadingPresented)
        XCTAssert(view.nameLabel?.text == nil)
        XCTAssert(view.descriptionLabel?.text == nil)
        XCTAssert(view.photoImageView?.image == nil)
        XCTAssert(!favoriteViewModel.isButtonVisible.value)
    }
}
