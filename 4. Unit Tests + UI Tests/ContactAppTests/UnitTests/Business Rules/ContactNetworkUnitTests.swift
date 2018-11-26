//
//  ContactNetworkUnitTests.swift
//  ContactAppTests
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import XCTest
@testable import ContactApp

class ContactNetworkUnitTests: XCTestCase {
    var provider: Providable?
    
    override func setUp() {
        super.setUp()
        provider = networkContainer.resolve(Providable.self)
    }
    
    func testNetworkGetContact() {
        let expectation = XCTestExpectation(description: "Request a contact over network")
        provider?.get(Contact.self) { [weak self] contact in
            guard let contact = contact else {
                XCTFail("Contact is nil")
                return
            }
            XCTAssert(contact.name == "Fernando")
            XCTAssert(contact.description == "Really cool guy. Lorem ipsum dolor sit amet, consectetur adipiscing elit")
            XCTAssert(contact.photoUrl == "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5vpRDuDJqlCCrIUqbLTU65_V44yk1XZjwcOK1H3zkvd-F_b8m")
            self?.provider?.getImage(contact.photoUrl) { image in
                XCTAssert(image != nil)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 30.0)
    }
    
}
