//
//  FavoriteMockUnitTests.swift
//  ContactAppTests
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import XCTest
@testable import ContactApp

class FavoriteMockUnitTests: XCTestCase {
    var view: FavoriteViewable?
    
    override func setUp() {
        super.setUp()
        view = mockContainer.resolve(FavoriteViewable.self)
    }
    
    func testFavoriteTap() {
        guard let view = view as? MockFavoriteViewController else {
            XCTFail("Unit test should be using mock view controller")
            return
        }
        // Given
        // favorite button using the unselected image
        XCTAssert(!view.isButtonSetWithSelectedImage)
        
        // When
        // the viewModel's tapFavorite method is called
        view.viewModel?.tapFavorite()
        
        // Then
        // favorite button using the selected image
        XCTAssert(view.isButtonSetWithSelectedImage)
        
        // When
        // the viewModel's tapFavorite method is called again
        view.viewModel?.tapFavorite()
        
        // Then
        // favorite button using the unselected image
        XCTAssert(!view.isButtonSetWithSelectedImage)
    }
}
