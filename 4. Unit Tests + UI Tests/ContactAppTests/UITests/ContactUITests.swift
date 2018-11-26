//
//  ContactUITests.swift
//  UITests
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import XCTest

class ContactUITests: XCTestCase {
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testContactFlow() {
        let app = XCUIApplication()
        let nameElement = app.staticTexts["nameLabel"]
        let descriptionElement = app.staticTexts["descriptionLabel"]
        let photoElement = app.images["photoImage"]
        let favoriteButton = app.buttons["favoriteButton"]
        XCTAssert(nameElement.waitForExistence())
        XCTAssert(descriptionElement.waitForExistence())
        XCTAssert(photoElement.waitForExistence())
        XCTAssert(favoriteButton.waitForExistence())
        XCTAssert(nameElement.label == "Fernando")
        XCTAssert(descriptionElement.label == "Really cool guy. Lorem ipsum dolor sit amet, consectetur adipiscing elit")
        favoriteButton.tap()
        favoriteButton.tap()
    }
}
