//
//  ContactSnapshotTests.swift
//  ContactAppTests
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import Foundation
import FBSnapshotTestCase
@testable import ContactApp

class ContactSnapshotTests: FBSnapshotTestCase {
    var view: ContactViewable?
    
    override func setUp() {
        super.setUp()
//        recordMode = true
        view = snapshotContainer.resolve(ContactViewable.self)
        view?.viewModel?.load()
    }
    
    override func tearDown() {
        view?.viewModel?.load()
    }
    
    func testDataLoading() {
        guard let viewModel = view?.viewModel as? MockContactViewModel else {
            XCTFail("Unit test should be using mock view model")
            return
        }
        guard let view = view as? ContactViewController else {
            XCTFail("Unit test should be using UIViewController")
            return
        }
        
        viewModel.settings = [.dataLoading]
        
        viewModel.verifyView { identifier in
            FBSnapshotVerifyView(view.view, identifier: identifier)
        }
    }
    
    func testShortText() {
        guard let viewModel = view?.viewModel as? MockContactViewModel else {
            XCTFail("Unit test should be using mock view model")
            return
        }
        guard let view = view as? ContactViewController else {
            XCTFail("Unit test should be using UIViewController")
            return
        }
        
        viewModel.settings = [.dataLoaded, .shortName, .shortDescription]
        
        viewModel.verifyView { identifier in
            FBSnapshotVerifyView(view.view, identifier: identifier)
        }
    }
    
    func testLongText() {
        guard let viewModel = view?.viewModel as? MockContactViewModel else {
            XCTFail("Unit test should be using mock view model")
            return
        }
        guard let view = view as? ContactViewController else {
            XCTFail("Unit test should be using UIViewController")
            return
        }
        
        viewModel.settings = [.dataLoaded, .longName, .longDescription]
        
        viewModel.verifyView { identifier in
            FBSnapshotVerifyView(view.view, identifier: identifier)
        }
    }
    
    func testFavoriteSelected() {
        guard let viewModel = view?.viewModel as? MockContactViewModel else {
            XCTFail("Unit test should be using mock view model")
            return
        }
        guard let view = view as? ContactViewController else {
            XCTFail("Unit test should be using UIViewController")
            return
        }
        
        viewModel.settings = [.dataLoaded, .favoriteSelected]
        
        viewModel.verifyView { identifier in
            FBSnapshotVerifyView(view.view, identifier: identifier)
        }
    }
    
    func testBackgroundActive() {
        guard let viewModel = view?.viewModel as? MockContactViewModel else {
            XCTFail("Unit test should be using mock view model")
            return
        }
        guard let view = view as? ContactViewController else {
            XCTFail("Unit test should be using UIViewController")
            return
        }
        
        viewModel.settings = [.dataLoaded,
                              .nameBackground,
                              .descriptionBackground,
                              .favoriteBackground]
        
        viewModel.verifyView { identifier in
            FBSnapshotVerifyView(view.view, identifier: identifier)
        }
    }
}


