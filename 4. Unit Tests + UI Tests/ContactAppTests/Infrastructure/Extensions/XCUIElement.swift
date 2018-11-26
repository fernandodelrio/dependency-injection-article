//
//  XCUIElement.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import XCTest

extension XCUIElement {
    func waitForExistence() -> Bool {
        return waitForExistence(timeout: 10.0)
    }
}
